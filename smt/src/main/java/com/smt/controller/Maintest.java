//package com.smt.controller;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.io.OutputStreamWriter;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.Scanner;
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//public class Maintest {
//    private static final int MAX_INPUT_LENGTH = 300;
//    private static final int MAX_RESPONSE_LENGTH = 300;
//
//    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//
//        System.out.println("채팅을 시작합니다. 종료하려면 '종료'를 입력하세요.");
//
//        while (true) {
//            System.out.print("사용자: ");
//            String userMessage = scanner.nextLine();
//
//            if (userMessage.equalsIgnoreCase("종료")) {
//                System.out.println("채팅을 종료합니다.");
//                break;
//            }
//
//            String limitedUserMessage = userMessage.substring(0, Math.min(userMessage.length(), MAX_INPUT_LENGTH));
//            String response = chatGPT(limitedUserMessage);
//            String limitedResponse = response.substring(0, Math.min(response.length(), MAX_RESPONSE_LENGTH));
//            System.out.println("ChatGPT: " + limitedResponse);
//        }
//
//        scanner.close();
//    }
//
//    public static String chatGPT(String message) {
//        String url = "https://api.openai.com/v1/chat/completions";
//        String apiKey = ""; // OpenAI API 키를 여기에 입력해주세요
//        String model = "gpt-3.5-turbo"; // ChatGPT API의 현재 모델
//
//        try {
//            // Create the HTTP POST request
//            URL obj = new URL(url);
//            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
//            con.setRequestMethod("POST");
//            con.setRequestProperty("Authorization", "Bearer " + apiKey);
//
//            con.setRequestProperty("Content-Type", "application/json");
//
//            // Build the request body
//            String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"system\", \"content\": \"20자 이내로 답변해줘\"}, {\"role\": \"user\", \"content\": \"" + message + "\"}]}";
//            con.setDoOutput(true);
//            OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
//            writer.write(body);
//            writer.flush();
//            writer.close();
//
//            // Get the response
//            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//            String inputLine;
//            StringBuilder response = new StringBuilder();
//            while ((inputLine = in.readLine()) != null) {
//                response.append(inputLine);
//            }
//            in.close();
//
//            // Returns the extracted contents of the response.
//            String extractedResponse = extractContentFromResponse(response.toString());
//            String cleanedResponse = extractedResponse.replace("\\n\\n", "");
//            return cleanedResponse;
//
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public static String extractContentFromResponse(String response) {
//        JSONObject responseObject = new JSONObject(response);
//        JSONArray messages = responseObject.getJSONArray("choices");
//        String content = messages.getJSONObject(0).getString("content");
//        return content;
//    }
//}
