package com.smt.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@RestController
@RequestMapping("/chat")
public class ChatController {



    @PostMapping(value="/chat", consumes="application/json", produces="application/json; charset=UTF-8")
    public static String chatGPT(@RequestBody Map<String, String> payload, HttpServletResponse res) {
        String message = payload.get("userMessage");
        String mbti = payload.get("userMBTI");  
        String url = "https://api.openai.com/v1/chat/completions";
        String apiKey = ""; 
        String model = "gpt-3.5-turbo"; // 

        try {
            
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + apiKey);
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");


        	int maxSystemMessageLength = 100; 
        	int maxUserMessageLength = 280;
            String systemMessage;
            if (mbti.equals("INTJ")) {
                systemMessage = "논의하고 싶은 주제가 있나요? 깊이 있는 분석을 통해 도움이 될 수 있습니다.";
            } else if (mbti.equals("INFP")) {
                systemMessage = "당신의 감정과 가치를 들려주세요. 심리적인 상담에 도움이 될 것입니다.";
            } else if (mbti.equals("ESTP")) {
                systemMessage = "도움이 필요한 상황을 알려주세요. 문제 해결에 도움이 될 것입니다.";
            } else if (mbti.equals("ISTJ")) {
                systemMessage = "구체적인 정보를 알려주세요. 신중한 분석을 통해 도움이 될 것입니다.";
            } else if (mbti.equals("ISFJ")) {
                systemMessage = "당신의 감정과 필요한 부분을 알려주세요. 함께 이해해 나가겠습니다.";
            } else if (mbti.equals("INFJ")) {
                systemMessage = "당신의 꿈과 이상을 공유해주세요. 같이 해결 방안을 찾아보겠습니다.";
            } else if (mbti.equals("ISTP")) {
                systemMessage = "문제나 상황을 알려주세요. 분석적인 접근으로 조언을 드릴 수 있습니다.";
            } else if (mbti.equals("ISFP")) {
                systemMessage = "당신의 기분이나 감정을 알려주세요. 함께 이야기를 나눠보아요.";
            } else if (mbti.equals("INTP")) {
                systemMessage = "탐구하고 싶은 주제가 있나요? 새로운 지식을 함께 찾아보겠습니다.";
            } else if (mbti.equals("ESFP")) {
                systemMessage = "오늘 하루를 어떻게 보냈나요? 생활에 활력을 불어넣을 수 있습니다.";
            } else if (mbti.equals("ENFP")) {
                systemMessage = "새로운 가능성에 대해 이야기해보아요. 열린 마음으로 들어보겠습니다.";
            } else if (mbti.equals("ENTP")) {
                systemMessage = "함께 뇌풀을 씨워볼 주제가 있나요? 독창적인 아이디어를 좋아합니다.";
            } else if (mbti.equals("ESTJ")) {
                systemMessage = "목표와 계획을 알려주세요. 체계적으로 도움을 드릴 수 있습니다.";
            } else if (mbti.equals("ESFJ")) {
                systemMessage = "오늘 어떤 일이 있었나요? 당신의 이야기를 경청하겠습니다.";
            } else if (mbti.equals("ENFJ")) {
                systemMessage = "당신의 생각을 들려주세요. 존중하고 사교적인 대화를 나누겠습니다.";
            } else if (mbti.equals("ENTJ")) {
                systemMessage = "달성하고 싶은 목표가 있나요? 효율적인 해결책을 찾아드릴 것입니다.";
            } else {
                systemMessage = "일반 대화 모드로 전환합니다: " + message;
            }

            if (systemMessage.length() > maxSystemMessageLength) {
                systemMessage = systemMessage.substring(0, maxSystemMessageLength);
            }

            
            if (message.length() > maxUserMessageLength) {
                message = message.substring(0, maxUserMessageLength);
            }

            
            String systemMessageJson = "{\"role\": \"system\", \"content\": \"" + systemMessage + "\"}";
            String userMessageJson = "{\"role\": \"user\", \"content\": \"" + message + "40자 이내로 존댓말로 끊기지 않게 답변해줘\"}";

            String body = "{\"model\": \"" + model + "\", \"messages\": [" + systemMessageJson + ", " + userMessageJson + "]}";

            con.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
            writer.write(body);
            writer.flush();
            writer.close();

            
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            
            System.out.println("ChatController===" + extractContentFromResponse(response.toString()));

            
            
            res.setCharacterEncoding("UTF-8");
            return extractContentFromResponse(response.toString());

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String extractContentFromResponse(String response) {
        int startMarker = response.indexOf("content")+11; 
        int endMarker = response.indexOf("\"", startMarker);
        return response.substring(startMarker, endMarker); 
    }

    
    @GetMapping(value="/chat", produces="text/html")   
    @ResponseBody
    public ModelAndView chatPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("chat/chat"); 
        return mav;
    }
}
