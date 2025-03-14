package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

//org . ~import 
public class Ex01 {
    public static void main(String[] args) {
        //Ex01.java
        
        //Jsoup
        //- 자바 프로그램이 브라우저처럼 사이트 접속 > 접속한 페이지 소스를 읽기 > 소스 분석 > 탐색 > 원하는 데이터 추출
        
        try {
            String url = "https://jsoup.org/";
            
            //접속해서 읽어온 문서 내용을 다 담고 있는 객체
            // =JavaScript의 document 객체 유사
            Document doc = Jsoup.connect(url).get();
            
            System.out.println(doc.html());
            System.out.println();
            System.out.println();
            System.out.println();
            
            //doc.getElementById(url);
            //doc.getElementsByClass(url);
            //doc.select(url);
            
            Elements list =doc.select(".content > .col1 > h1");
            System.out.println(list.size());
            System.out.println(list.get(0).text());
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }//main
}//class





















