package com.human.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class ClovaSentiment {
	
	public String ClovaSensiment(String state){

        String clientId = "x69u6k7k0i";
        String clientSecret = "lFy2CQ4aiXuvVBD9CqXeCYZLanHqixrgOjM3ckYA";
        String text = state;

        try {
            String apiUrl = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";
            URL url = new URL(apiUrl);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            conn.setDoOutput(true);

            String requestBody = "{\"content\":\"" + text + "\"}";

            OutputStream outputStream = conn.getOutputStream();
            outputStream.write(requestBody.getBytes("UTF-8"));
            outputStream.flush();
            outputStream.close();

            int responseCode = conn.getResponseCode();

            BufferedReader br;
            if (responseCode == 200) { // 성공적인 응답
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line;
            StringBuilder response = new StringBuilder();
            
            while ((line = br.readLine()) != null) {
            	response.append(line);
            	
            }
            
            
            
            br.close();
            conn.disconnect();

            
            return response.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	

}
