package com.md.mdboiler.dao;

import com.md.mdboiler.model.BoilerData;

public interface BoilerDataRepository {
    void setData(BoilerData boilerData);
    BoilerData getCurrent();
}
