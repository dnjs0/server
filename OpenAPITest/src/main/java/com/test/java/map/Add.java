package com.test.java.map;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/map/add.do")

public class Add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Add.java
        

        //servlet 알바샌만 씀, jsp알바생 안씀 > 보여주는것이 없음
        //req.getRequestDispatcher("/WEB-INF/views/map/add.jsp").forward(req, resp);

    }

}