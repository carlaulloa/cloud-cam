package pe.edu.sistemas.cloudcam.repository.impl;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import pe.edu.sistemas.cloudcam.controller.CapturaModel;
import pe.edu.sistemas.cloudcam.domain.Captura;
import pe.edu.sistemas.cloudcam.repository.CapturaDAO;

@Repository("capturaMysql")
public class CapturaMysqlDAOImpl extends DGenericoImpl<Captura, Integer> implements Serializable, CapturaDAO{

	@Override
	public String save(CapturaModel capturaModel) {
		 return null;
	}
	
	@Override
	public String save(Captura captura) {
		 String salida = null;
	        Session session = getCurrentSession();
	        try {
	          //  tx = session.beginTransaction();
	            salida = String.valueOf(session.save(captura));
	            session.flush();
	            session.evict(captura);
	          //  tx.commit();
	        } catch (HibernateException he) {
	            he.printStackTrace();
	        } /*finally {
	            session.close();
	        }*/

	        return salida;
	}

}
