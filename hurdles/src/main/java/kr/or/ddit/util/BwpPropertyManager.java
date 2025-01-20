package kr.or.ddit.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import jakarta.servlet.ServletContext;

public class BwpPropertyManager {
    /**
     * 주어진 key 값에 해당하는 프로퍼티 값을 반환
     */
    public static String getProperty(ServletContext context, String keyName) {
        Properties properties = new Properties();
        String value = "";

        // config.properties 경로
        String filePath = "/WEB-INF/classes/config.properties";

        try (InputStream input = context.getResourceAsStream(filePath)) {
            if (input == null) {
                System.out.println("Properties file not found: " + filePath);
                return value;
            }

            // properties 파일 로드
            properties.load(input);

            // 값 읽기
            value = properties.getProperty(keyName);
        } catch (IOException ex) {
            ex.printStackTrace();
            System.out.println("Failed to load properties file from: " + filePath);
        }

        return value;
    }
}
