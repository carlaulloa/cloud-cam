package pe.edu.sistemas.cloudcam.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(value = {ServConfig.class /*,SecurityConfiguration.class*/})
public class ApplicationConfig {

}