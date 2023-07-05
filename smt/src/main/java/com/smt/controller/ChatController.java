package com.smt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/chat")
public class ChatController {

    private static final int MAX_INPUT_LENGTH = 300;
    private static final int MAX_RESPONSE_LENGTH = 100;

    @PostMapping(value="/chat", consumes="application/json", produces="application/json; charset=UTF-8")
    public static String chatGPT(@RequestBody Map<String, String> payload, HttpServletResponse res) {
    	String message = payload.get("userMessage");
        String url = "https://api.openai.com/v1/chat/completions";
        String apiKey = ""; 
        String model = "gpt-3.5-turbo"; // current model of chatgpt api

        try {
            // Create the HTTP POST request
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + apiKey);
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

            // Build the request body
            String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"system\", \"content\": \"20자이내라 답변해줘" + message + "\"}]}";
            con.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
            writer.write(body);
            writer.flush();
            writer.close();

            // Get the response
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            
            System.out.println("ChatController===" + extractContentFromResponse(response.toString()));

            // returns the extracted contents of the response.
            
            res.setCharacterEncoding("UTF-8");
            return extractContentFromResponse(response.toString());

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String extractContentFromResponse(String response) {
        int startMarker = response.indexOf("content")+11; // Marker for where the content starts.
        int endMarker = response.indexOf("\"", startMarker); // Marker for where the content ends.
        return response.substring(startMarker, endMarker); // Returns the substring containing only the response.
    }


	// 채팅 화면을 보여주는 핸들러
    @GetMapping(value="/chat", produces="text/html")   
    @ResponseBody
    public ModelAndView chatPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("chat/chat"); 
        return mav;
    }

    
}
