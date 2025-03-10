package com.test.java;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    public Connection open() {
      //java.sql.Connection
        Connection conn = null;
        
        //접속 정보 > 미리 문자열 > 연결 문자열(Connection String)
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "server";
        String pw = "java1234";
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, id, pw);
            
            return conn;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
