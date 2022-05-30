package pe.edu.sistemas.cloudcam.repository;

import pe.edu.sistemas.cloudcam.controller.CapturaModel;
import pe.edu.sistemas.cloudcam.domain.Captura;

public interface CapturaDAO {

	
	public String save(CapturaModel capturaModel);
	public String save(Captura captura);
}
