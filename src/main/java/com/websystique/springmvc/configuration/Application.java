package com.websystique.springmvc.configuration;


import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
@EnableOAuth2Sso
@SpringBootApplication(scanBasePackages = {"com.websystique.springmvc"})
@ComponentScan(basePackages = "com.websystique.springmvc")
@PropertySource(value = { "classpath:application.properties" })
public class Application extends SpringBootServletInitializer {
	static String RESOURCES_DIR;
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	 @Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}
}
