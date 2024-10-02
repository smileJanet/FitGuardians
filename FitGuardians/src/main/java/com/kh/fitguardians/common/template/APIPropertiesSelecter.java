package com.kh.fitguardians.common.template;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class APIPropertiesSelecter {
	
	// properties 불러오기 적용 완료
	// TODO: 각 소셜 로그인 로직 구현하기
	public static String naverLoginAPI() throws IOException {
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(APIPropertiesSelecter.class.getResource("/apiProperties.properties").getPath());
		prop.load(fis);
		String naverApi = prop.getProperty("naverApi");
		
		System.out.println(naverApi);
		
		return naverApi;
	}
	
}
