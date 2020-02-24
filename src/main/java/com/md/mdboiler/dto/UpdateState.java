package com.md.mdboiler.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateState {
    private int establishedTemperature;
    private boolean isOn;

    public UpdateState(int establishedTemperature, boolean isOn) {
        this.establishedTemperature = establishedTemperature;
        this.isOn = isOn;
    }
}
