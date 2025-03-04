package com.test.java;

import java.io.File;
import java.io.FileWriter;
import java.util.Random;

public class Ex01 {
    public static void main(String[] args) {
        //서블릿 역할을 하는 자바
        //구구단 중 랜덤으로 하나 출력 > 웹페이지로 
        try {
            //ctrl + shift + o : 전체 import
            Random rnd = new Random();
            
            int dan = rnd.nextInt(8)+2;
            
            //webapp폴더 안에 있어야함 !!
            File file = new File(".");
            //파일 위치 알아보기
//            System.out.println(file.getAbsolutePath());
            
            FileWriter writer = new FileWriter(".\\src\\main\\webapp\\ex01.html");
            writer.write("<html>");
            writer.write("<head>");
            writer.write("<meta charset='UTF-8'>");
            writer.write("</head>");
            writer.write("<body>");
            writer.write(String.format("<h1>%d단</h1>",dan));
            for(int i=1; i<=9; i++) {
                writer.write(String.format("<div>%d x %d = %d</div>",dan,i,dan*i));
            }
            writer.write("</body>");
            writer.write("</html>");
            
            
            writer.close();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }

}
