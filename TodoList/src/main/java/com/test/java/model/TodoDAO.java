package com.test.java.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.util.DBUtil;

//서블릿(X)
//서블릿 > 업무 위입 > 일반 클래스(O)

//Data Access object > 데이터 작업 전문가 or 담당자 > JDBC
public class TodoDAO {
    
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;
    private DBUtil util;
    
    public TodoDAO() {
        try {
            this.conn= util.open();
            this.stat= conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //할일 목록 달라고 요청
    public 반환값 list() {
        
        try {
            String sql = "select * from tblTodo order by seq desc";
            rs = stat.executeQuery(sql);
            
             //ResultSet > (변환) > 누구나 다 알 수 있는 자료형?
            //-TodoDTO : 레코드 1줄
            //- ArrayList<TodoDTO> : 레코드 N줄 == 테이블 ==   ResultSet
            
            //rs > (복사) > list
            ArrayList<TodoDTO> list = new ArrayList()<>();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}










































