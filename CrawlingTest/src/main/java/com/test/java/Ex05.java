package com.test.java;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Ex05 {
    public static void main(String[] args) {
        //CSR or SSR 크롤링
        //  - Selenium, HTMLUnit 등....
        
        //Selenium
        // - 크롤링 전용 도구는 아님
        // - 자동화 테스트 도구(사람 대신 브라우징을 하는 프로그램)
        
//        m1();
        m2();
        
    }//main

    private static void m2() {
        // 자동화 테스트
        // - 사이트 완성 > 테스트
        String url = "http://lms1.sist.co.kr/worknet/SLogin.asp";
        
        String webDriverID = "webdriver.chrome.driver";
        String path ="C:\\class\\dev\\chromedriver.exe";
        System.setProperty(webDriverID, path);
        
        WebDriver driver = new ChromeDriver(); 
        driver.get(url);
        
        //strLoginID
        //strLoginPwd
        //#content > div > form > table > tbody > tr > td > div > div.login-form > div.login-btn > input
        //#content div.login-btn > input
        
        driver.findElement(By.id("strLoginID")).sendKeys("박세원");
        driver.findElement(By.id("strLoginPwd")).sendKeys("3478");
        driver.findElement(By.cssSelector("#content div.login-btn > input")).click();
        
        
        //페이지 전환중에 잠시 쉬어야한다.
        //왜냐! 페이지가 전환되기 전에 밑의 코드가 실행되어서 페이지 전환이 안될수 있다.\
        //페이지 전환이 확실하게 되게끔 기다려줌
        try {
            Thread.sleep(1000);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        //페이지 전환
        //#content > div > div > div > div.panel-body > div.popbtmbtn_section > div > a:nth-child(9)
        //#content > div.popbtmbtn_section > div > a:nth-child(9)
        driver.findElement(By.cssSelector("div.popbtmbtn_section > div > a:nth-child(9)")).click();
        
        
        
        //페이지 화면전환 중 쉬어가기~
        try {
            Thread.sleep(500);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        //saveBt
        driver.findElement(By.id("saveBt")).click();
        
    }

    private static void m1() {
        //셀레니움  설치
        //1. 셀레니움 브라우저(*.jar) 
        //2. 브라우저(크롬) 드라이버(*.exe) > 경로 지정해서 호출하기
        /*
         * https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.88/win64/
         * chromedriver-win64.zip
         */        
        
        String webDriverID = "webdriver.chrome.driver";
        String path ="C:\\class\\dev\\chromedriver.exe";
        System.setProperty(webDriverID, path);
        
        
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless=new");
        
        WebDriver driver = new ChromeDriver(options); //브라우저
//        WebDriver driver = new ChromeDriver(); //브라우저
        
        String url = "http://localhost:8090/crawling/ex04.jsp";
        driver.get(url);
        
        WebElement h2 = driver.findElement(By.id("h2"));
        
        System.out.println(h2.getText());
        
        
        WebElement txt1 = driver.findElement(By.id("txt1"));
        txt1.sendKeys("홍길동입니다.");
        
        
        WebElement btn1 = driver.findElement(By.id("btn1"));
        btn1.click();
        
        //동적 녀석들 크롤링
        //WebElement list2 = driver.findElement(By.id("list2"));
        List<WebElement> list = driver.findElements(By.cssSelector("#list2 > li"));
        System.out.println(list.size());
        
        for(WebElement li : list) {
            //li.findElement(By.cssSelector("span:first-child")).getText();
            System.out.println(li.findElement(By.cssSelector("span:first-child")).getText());
            System.out.println(li.findElement(By.cssSelector("span:last-child")).getText());
            System.out.println();
        }
        
    }//m1
}



























