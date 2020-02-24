package com.md.mdboiler.dao.impl;

import com.md.mdboiler.dao.BoilerDataRepository;
import com.md.mdboiler.model.BoilerData;
import org.springframework.stereotype.Service;

@Service
public class BoilerDataRepositoryImpl implements BoilerDataRepository {

    private BoilerData boilerData;

    BoilerDataRepositoryImpl() {
        boilerData = new BoilerData();
    }

    @Override
    public void setData(BoilerData boilerData) {
        this.boilerData = boilerData;
    }

    @Override
    public BoilerData getCurrent() {
        return boilerData;
    }
}
