package com.module3.ss12_crud.service.impl;

import com.module3.ss12_crud.model.User;
import com.module3.ss12_crud.repository.IUserRepository;
import com.module3.ss12_crud.repository.impl.UserRepository;
import com.module3.ss12_crud.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void save(User user) {
        iUserRepository.save(user);
    }

    @Override
    public void update(User user) {
        iUserRepository.update(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return iUserRepository.findByCountry(country);
    }

    @Override
    public void delete(int idDel) {
        iUserRepository.delete(idDel);
    }

    @Override
    public List<User> sortByName() {
        return iUserRepository.sortByName();
    }

    @Override
    public User findById(int idEdit) {
        List<User> list = iUserRepository.findAll();
        User user = iUserRepository.findById(idEdit);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == user.getId()) {
                return list.get(i);
            }
        }
        return null;
    }
}
