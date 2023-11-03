package com.cos.Fruits.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Value("${uploadPath}")
	String uploadPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registy) {
		registy.addResourceHandler("/imges/**").addResourceLocations(uploadPath);
	}
}
