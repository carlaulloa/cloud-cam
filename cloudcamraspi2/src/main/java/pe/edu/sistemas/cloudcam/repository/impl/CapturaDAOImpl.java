package pe.edu.sistemas.cloudcam.repository.impl;


import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.client.MongoDatabase;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSInputFile;

import pe.edu.sistemas.cloudcam.controller.CapturaModel;
import pe.edu.sistemas.cloudcam.domain.Captura;
import pe.edu.sistemas.cloudcam.repository.CapturaDAO;
import pe.edu.sistemas.cloudcam.util.Conexion;
import pe.edu.sistemas.cloudcam.util.GeneradorSecuencia;

@Repository
public class CapturaDAOImpl implements CapturaDAO{

	private final String C_CAPTURA = "CAPTURAS_STORE";
	
	@Override
	public String save(CapturaModel capturaModel) {
		int idGenerado = GeneradorSecuencia.generarId(C_CAPTURA);
        capturaModel.setId(idGenerado);
        
        
        
        MongoDatabase mg = Conexion.getConnection();
        Document documento = crearNuevoDocumento(capturaModel);
        mg.getCollection(C_CAPTURA).insertOne(documento);

     /*
        MongoDatabase mg = Conexion.getConnection();
       
        Document documento = crearNuevoDocumento(capturaModel);
        mg.getCollection(C_CAPTURA).insertOne(documento);
        */
        /*
        byte[] imageBytes64 = capturaModel.getValue();

        byte[] imageBytes = Base64.getDecoder().decode(imageBytes64);
        
        DB db = Conexion.mongoClient.getDB(Conexion.BD_NOMBRE);

        GridFS fileStore = new GridFS( db ,C_CAPTURA);

        GridFSInputFile in = fileStore.createFile( imageBytes );
        in.setId(capturaModel.getId());
        in.setFilename(capturaModel.getDetail());
        in.save();
        */
        
        
        
        return "ok";
	}
	
    private Document crearNuevoDocumento(CapturaModel capturaModel) {
        Document doc = new Document();
        doc.append("id",capturaModel.getId())
                .append("detail", capturaModel.getDetail())
                .append("value", capturaModel.getValue())
             ;
        return doc;
    }

	@Override
	public String save(Captura captura) {
		// TODO Auto-generated method stub
		return null;
	}

}
