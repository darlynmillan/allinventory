package com.example.allinventorySPRING.repositories;

import org.springframework.data.repository.CrudRepository;
import com.example.allinventorySPRING.models.user_model;

public interface user_repository extends CrudRepository<user_model, Long> {

}
