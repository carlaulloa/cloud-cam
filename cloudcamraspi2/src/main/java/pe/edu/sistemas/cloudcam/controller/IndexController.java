package pe.edu.sistemas.cloudcam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	
	@RequestMapping(value = "/")
	public String viewIndex(){
		return "index";
	}

}
