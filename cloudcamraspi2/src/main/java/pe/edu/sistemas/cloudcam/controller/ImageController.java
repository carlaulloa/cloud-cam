package pe.edu.sistemas.cloudcam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.edu.sistemas.cloudcam.service.CapturaService;

@Controller
public class ImageController {

	@Autowired
	private CapturaService capturaService;
	
	
	@RequestMapping(value ="/save",method = RequestMethod.POST, produces="application/json")
	public @ResponseBody Mensaje requestSaveImage(@RequestBody CapturaModel captura){
		String texto = capturaService.saveData(captura);
		Mensaje msj = new Mensaje();
		msj.setTexto(texto);
		return msj;
		
	}

}
