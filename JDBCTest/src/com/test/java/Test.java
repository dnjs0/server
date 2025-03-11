package com.test.java;

public class Test {
    public static void main(String[] args) {
        String data = "사과,배,귤,수박\n" +  
                "딸기,포도,망고,키위\n" +  
                "바나나,체리,복숭아,자두";  

      String[] rows = data.split("\n"); // 줄바꿈 문자를 기준으로 행을 나눔  
    
      for (String row : rows) {  
          String[] cols = row.split(","); // 쉼표를 기준으로 열을 나눔  
          for (String col : cols) {  
              System.out.print(col + "\t"); // 탭 문자를 사용하여 열을 구분하여 출력  
          }  
          System.out.println(); // 다음 행으로 이동  
      } 
            
        }
}
