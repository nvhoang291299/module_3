package com.module3.ss12_crud.repository;

import com.module3.ss12_crud.model.User;
import com.module3.ss12_crud.repository.impl.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    void save(User user);

}
