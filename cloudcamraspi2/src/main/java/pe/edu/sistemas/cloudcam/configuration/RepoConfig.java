package pe.edu.sistemas.cloudcam.configuration;

import java.util.Properties;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

@Configuration
@ComponentScan(basePackages = "pe.edu.sistemas.cloudcam.repository.impl")

public class RepoConfig /*extends AbstractMongoConfiguration */{

	/*public static String BD_NOMBRE = "cloudcamraspi2";
	public static String BD_USER = "admin";
	public static String BD_PASS = "wK8RXwyxKyB6";
	public static String BD_HOST = "127.12.96.130";
	public static String BD_PUERTO = "27017";

	@Override
	protected String getDatabaseName() {
		return BD_NOMBRE;
	}

	@Override
	public Mongo mongo() throws Exception {
		ServerAddress serverAddress = new ServerAddress(BD_HOST, Integer.parseInt(BD_PUERTO));

		MongoCredential credential = MongoCredential.createCredential(BD_USER, getDatabaseName(),
				BD_PASS.toCharArray());

		MongoClient client = new MongoClient(serverAddress, Arrays.asList(credential));
		return client;
	}

	@Override
	protected String getMappingBasePackage() {
		return "pe.edu.sistemas.cloudcam.repository";
	}*/

    @Bean(name = "dataSource", destroyMethod = "close")
    public BasicDataSource dataSource(Environment environment){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://127.12.96.132:3306/cloudcamraspi2");
        dataSource.setUsername("admindl5vzXe");
        dataSource.setPassword("5dxR3xmIdDIr");
//        dataSource.setUsername("b4a929cda1e827");
//        dataSource.setPassword("d09727b6");
        return dataSource;
    }
    
    @Bean(name = "sessionFactory")
    public LocalSessionFactoryBean localSessionFactoryBean(
            BasicDataSource dataSource, Environment environment){
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(dataSource);
        localSessionFactoryBean.setPackagesToScan("pe.edu.sistemas.cloudcam.domain");
        
        Properties hibernateProperties = new Properties();
            hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        localSessionFactoryBean.setHibernateProperties(hibernateProperties);
        return localSessionFactoryBean;
    }

}
