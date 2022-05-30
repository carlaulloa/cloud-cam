package pe.edu.sistemas.cloudcam.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.sistemas.cloudcam.controller.CapturaModel;
import pe.edu.sistemas.cloudcam.domain.Captura;
import pe.edu.sistemas.cloudcam.repository.CapturaDAO;
import pe.edu.sistemas.cloudcam.service.CapturaService;

@Service
@Transactional(readOnly = true)
public class CapturaServiceImpl implements CapturaService {

	@Autowired
	@Qualifier("capturaMysql")
	private CapturaDAO capturaDAO;
	
	@Override
	@Transactional(readOnly = false)
	public String saveData(CapturaModel captura) {
		
		Captura capturaE = new Captura();
		capturaE.setDetail(captura.getDetail());
		captura.setValue(captura.getValue());
		
		return capturaDAO.save(capturaE);
	}

}
