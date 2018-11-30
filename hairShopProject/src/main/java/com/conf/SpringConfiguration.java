package com.conf;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration //얘는 환경설정 파일이얌!
public class SpringConfiguration {
	
	@Bean("dataSource") //이건 클래스 위에 설정하는 게 아니구, 메소드에서 리턴하는 값을 Bean으로 생성하는 거니까 @Component가 아니라 @Bean이당!! 
	public BasicDataSource getBasicDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		basicDataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		basicDataSource.setUsername("hair");
		basicDataSource.setPassword("hair");
		basicDataSource.setMaxTotal(20);
		basicDataSource.setMaxIdle(3);

		return basicDataSource;
	}
}
