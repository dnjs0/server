package com.test.java.map;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.java.model.MapDAO;
import com.test.java.model.MapDTO;

@WebServlet("/map/add.do")

public class Add extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Add.java
        
        String lat = req.getParameter("lat");
        String lng = req.getParameter("lng");
        //인자 2개니까 dto 상자에 담기
        MapDTO dto = new MapDTO();
        dto.setLat(lat);
        dto.setLng(lng);

        //servlet 알바샌만 씀, jsp알바생 안씀 > 보여주는것이 없음
        //req.getRequestDispatcher("/WEB-INF/views/map/add.jsp").forward(req, resp);

        MapDAO dao = new MapDAO();
        dao.add(dto);
        
        //add.do > ex04.do로 이동 
        resp.sendRedirect("/api/map/ex04.do");
    }

}