package com.md.mdboiler.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoilerData {
    private float lastTemperatureFromSensor;
    private int establishedTemperature;
    private boolean isOn;

    public BoilerData() {
        this.lastTemperatureFromSensor = 0;
        this.establishedTemperature = 0;
        this.isOn = true;
    }
}
