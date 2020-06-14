package com.chl.applet.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cal")
public class CalculationProcedureController {

    @RequestMapping("to_dimension_chain")
    public String toDimensionChain(){
        return "cal/dimension_chain";
    }

}
