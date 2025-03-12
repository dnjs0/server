package com.test.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //PrintWriter writer = resp.getWriter();
        //writer.write("<h1>Hello</h1>");
        
        //업무 코드 작성~
        //-DB 작업 > select
        String name = "홍길동";
        
        req.setAttribute("name", name);
        
        
        // 자바에서의 /: webapp인데 resp는 별종
        //resp를 쓰지 않는이유!! > jsp에서 req 이용해야한느데 req가 죽어버람
        //resp.sendRedirect("/mvc/hello.jsp"); > 주소가 jsp라서 헷갈림..
        
        //pageContext.forward("/mvc/hello.jsp"); > pageContext는 java에서는 지원x
        // 자바에서의 /: webapp
        RequestDispatcher dispatcher = req.getRequestDispatcher("/hello.jsp");
        dispatcher.forward(req, resp);
        
    }

}

























