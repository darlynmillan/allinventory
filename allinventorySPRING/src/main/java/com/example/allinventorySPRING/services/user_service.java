package com.example.allinventorySPRING.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.allinventorySPRING.models.user_model;
import com.example.allinventorySPRING.repositories.user_repository;

@Service
public class user_service {

    @Autowired
    user_repository usuario_repositorio;

    public ArrayList<user_model> read_user() {
        return (ArrayList<user_model>) usuario_repositorio.findAll();
    }

    public user_model save_user(user_model usuario) {
        return usuario_repositorio.save(usuario);
    }

}
