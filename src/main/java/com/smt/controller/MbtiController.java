package com.smt.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smt.model.Mbti;

@Controller
public class MbtiController {

    @GetMapping("/mbti")
    public ModelAndView getMbtiPage() {
        ModelAndView modelAndView = new ModelAndView("mbti");
        // 모델 객체를 만들고 뷰에 추가
        Mbti mbti = new Mbti("INTJ", "Elon Musk", "토론 내용");
        modelAndView.addObject("mbti", mbti);
        return modelAndView;
    }
}

