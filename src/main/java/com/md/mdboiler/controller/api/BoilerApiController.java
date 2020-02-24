package com.md.mdboiler.controller.api;

import com.md.mdboiler.dao.BoilerDataRepository;
import com.md.mdboiler.dto.UpdateState;
import com.md.mdboiler.model.BoilerData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/api/boiler")
public class BoilerApiController {

    private final
    BoilerDataRepository boilerDataRepository;

    public BoilerApiController(BoilerDataRepository boilerDataRepository) {
        this.boilerDataRepository = boilerDataRepository;
    }

    @RequestMapping(value = "/user", method = RequestMethod.PUT)
    public @ResponseBody
    String updateDataFromUser(@RequestBody UpdateState state) {
        BoilerData boilerData = boilerDataRepository.getCurrent();
        boilerData.setEstablishedTemperature(state.getEstablishedTemperature());
        boilerData.setOn(state.isOn());
        boilerDataRepository.setData(boilerData);
        return "OK";
    }

    @RequestMapping(value = "/chip", method = RequestMethod.PUT)
    public @ResponseBody
    UpdateState updateDataFromBoiler(@RequestParam float temperatureFromSensor) {
        BoilerData boilerData = boilerDataRepository.getCurrent();
        boilerData.setLastTemperatureFromSensor(temperatureFromSensor);
        boilerDataRepository.setData(boilerData);

        UpdateState updateState = new UpdateState(boilerData.getEstablishedTemperature(), boilerData.isOn());
        return updateState;
    }
}

