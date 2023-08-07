package com.human.py;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MyClient {
	
	
    public String Sentiment(String comment)throws Exception {
        String url = "http://localhost:5000"; // Flask 서버의 URL
        String message = URLEncoder.encode(comment, StandardCharsets.UTF_8.toString()); // 전송할 값
        
      
        
        RestTemplate restTemplate = new RestTemplate();

        // 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // 전송할 데이터 설정
        HttpEntity<String> requestEntity = new HttpEntity<>(message, headers);

        // POST 요청 보내기
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);

        
        
        
        if (response.getStatusCode().is2xxSuccessful()) {
            String responseBody = response.getBody();
            System.out.println(responseBody);
            return responseBody;
        } else {
            System.out.println("Request failed with status: " + response.getStatusCode());
            return "error";
        }
    }
}