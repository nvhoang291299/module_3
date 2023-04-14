package com.module3.ss12_crud.repository.impl;

import com.module3.ss12_crud.model.User;
import com.module3.ss12_crud.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select id, name, email, country from users");
            ResultSet resultSet = preparedStatement.executeQuery();

            User user;
            while(resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void save(User user) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("insert into users (name, email, country) values (?, ?, ?);");

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("UPDATE users SET name = ?, email = ?, country = ? WHERE id = ?;");

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select id, name, email, country from users where country like ?;");
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();

            User user;
            while(resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void delete(int idDel) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("delete from users where id = ?;");
            preparedStatement.setInt(1, idDel);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select id, name, email, country from users order by name");
            ResultSet resultSet = preparedStatement.executeQuery();

            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
                }
            } catch(SQLException e){
                e.printStackTrace();
            }
        return null;
        }

    @Override
    public User findById(int idEdit) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select id, name, email, country from users where id = ?");
            preparedStatement.setInt(1, idEdit);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            if(resultSet.next()){
                user = new User();
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
