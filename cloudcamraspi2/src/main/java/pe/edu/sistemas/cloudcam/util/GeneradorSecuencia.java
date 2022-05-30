package pe.edu.sistemas.cloudcam.util;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.bson.Document;

public class GeneradorSecuencia {
    private static final String COLECCION_SECUENCIAS = "Secuencias";
    
    public static Integer generarId(String nombreColeccionGenerar) {
        MongoDatabase mg = Conexion.getConnection();
        MongoCollection<Document> countersCollection = mg.getCollection(COLECCION_SECUENCIAS);
        Document searchQuery = new Document("_id", nombreColeccionGenerar);
        Document increase = new Document("seq", 1);
        Document updateQuery = new Document("$inc", increase);
        Document result = countersCollection.findOneAndUpdate(searchQuery, updateQuery);
      
        return result.getInteger("seq");
        
    }
}
