package pe.edu.sistemas.cloudcam.util;

import java.net.UnknownHostException;
import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

import com.mongodb.DB;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoDatabase;


public class Conexion {
	private DB mongoDB;
	
	public static MongoDatabase mg;

	public Conexion() {
		super();
	}


	public static MongoDatabase getConnection() {
		String mongoHost = /*System.getenv("$OPENSHIFT_MONGODB_DB_HOST");*/ "127.12.96.130";
		String mongoPort = /*System.getenv("$OPENSHIFT_MONGODB_DB_PORT");*/ "27017";
		String mongoUser = /*System.getenv("$OPENSHIFT_MONGODB_DB_USERNAME");*/"admin";
		String mongoPassword =/* System.getenv("$OPENSHIFT_MONGODB_DB_PASSWORD");*/ "wK8RXwyxKyB6";
		String mongoDBName = /*System.getenv("$OPENSHIFT_APP_NAME");*/ "cloudcamraspi2";

		int port = Integer.decode(mongoPort);

		MongoCredential mongoCredential = MongoCredential
				.createMongoCRCredential(mongoUser, mongoDBName,
						mongoPassword.toCharArray());
		
		MongoClient mgclient  = new MongoClient(new ServerAddress(
				mongoHost, port),
				Arrays.asList(mongoCredential));
		mg = mgclient.getDatabase(mongoDBName);
		


		return mg;

	}

	public DB getDB() {
		return mongoDB;

		}
}
