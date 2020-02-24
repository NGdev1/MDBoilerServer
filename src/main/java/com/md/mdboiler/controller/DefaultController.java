package com.md.mdboiler.controller;

import com.md.mdboiler.dao.BoilerDataRepository;
import com.md.mdboiler.model.BoilerData;
import com.md.mdboiler.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

@Controller
@ApiIgnore
public class DefaultController {

    private final
    BoilerDataRepository boilerDataRepository;

    public DefaultController(BoilerDataRepository boilerDataRepository) {
        this.boilerDataRepository = boilerDataRepository;
    }

    @RequestMapping(value = "/set-state", method = RequestMethod.GET)
    public String setState(HttpServletRequest request, ModelMap modelMap) {

        BoilerData boilerData = boilerDataRepository.getCurrent();
        modelMap.put("data", boilerData);
        modelMap.put("content", "set-state");

        if (Utils.isAjax(request)) {
            return "site/set-state";
        } else {
            return "site/index";
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap modelMap) {

        BoilerData boilerData = boilerDataRepository.getCurrent();
        modelMap.put("data", boilerData);
        modelMap.put("content", "main");

        if (Utils.isAjax(request)) {
            return "site/main";
        } else {
            return "site/index";
        }
    }
}
