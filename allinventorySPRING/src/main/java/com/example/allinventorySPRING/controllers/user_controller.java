package com.example.allinventorySPRING.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.allinventorySPRING.models.user_model;
import com.example.allinventorySPRING.services.user_service;

@RestController
@RequestMapping("/usuario")
public class user_controller {
    @Autowired
    user_service usuario_servicio;

    @GetMapping
    public ArrayList<user_model> read_user() {
        return usuario_servicio.read_user();
    }

    @PostMapping
    public user_model save_user(@RequestBody user_model usuario) {
        return this.usuario_servicio.save_user(usuario);
    }
}
