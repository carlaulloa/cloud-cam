package pe.edu.sistemas.cloudcam.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.channel.PublishSubscribeChannel;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHandler;
import org.springframework.messaging.MessagingException;

@Configuration
public class MQTTConfiguration {

	private static String TOPIC= "testeo";
	
	@Bean
	public MqttPahoMessageDrivenChannelAdapter mqttInbound() {		
		
	    MqttPahoMessageDrivenChannelAdapter mqtt = new MqttPahoMessageDrivenChannelAdapter( "testeo" + "-sub", clientFactory( ), TOPIC );
	    mqtt.setQos( 0 );
	    mqtt.setOutputChannel( outbount( ) );
	    mqtt.setAutoStartup( true );
	    
	 //    mqtt.setTaskScheduler( taskScheduler( ) );

	    return mqtt;
	}

	@Bean
	public MqttPahoMessageHandler mqqtMessageHandler() {

	    return new MqttPahoMessageHandler( TOPIC + "-pub", clientFactory( ) );
	}

	@Bean
	public DefaultMqttPahoClientFactory clientFactory() {

	    DefaultMqttPahoClientFactory clientFactory = new DefaultMqttPahoClientFactory( );
	    clientFactory.setUserName( "web" );
	    clientFactory.setPassword( "web" );
	    clientFactory.setServerURIs( new String[] { "tcp://m13.cloudmqtt.com:18381" } );
	    return clientFactory;
	}

	@Bean
	public PublishSubscribeChannel outbount() {

	    PublishSubscribeChannel psc = new PublishSubscribeChannel( );
	    psc.subscribe( new MessageHandler( ) {
			@Override
			public void handleMessage(Message<?> arg0) throws MessagingException {
				// TODO Auto-generated method stub
				
			}
	    } );

	    return psc;
	}
}
