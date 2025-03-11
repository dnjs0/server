package com.test.java;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

public class Ex06_CallableStatement {
    public static void main(String[] args) {
        //Ex06_CallableStatement.java
        
        //temp();
//        m1();
//        m2();
//        m3();
//        m4();
        m5();
        
    }//main

    private static void m5() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            
            String sql = "{call procM5(?,?)}";
            stat = conn.prepareCall(sql);
            
            stat.setString(1, "f");
            stat.registerOutParameter(2, OracleTypes.CURSOR);
            
            stat.executeQuery();
            
            //****
            //out > 오라클의 커서 == 결과셋 참조 == JDBC ResultSet
            rs = (ResultSet)stat.getObject(2);
            while(rs.next()) {
                System.out.println(rs.getString("name"));
                System.out.println(rs.getString("age"));
                System.out.println(rs.getString("gender"));
                System.out.println(rs.getString("tel"));
                System.out.println(rs.getString("address"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }        
    }

    private static void m4() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            
            String sql = "{call procM4(?, ?, ?, ?, ?, ?)}";
            stat = conn.prepareCall(sql);
            
            //in
            stat.setString(1, "12");
            
            //out
            stat.registerOutParameter(2, OracleTypes.VARCHAR);
            stat.registerOutParameter(3, OracleTypes.NUMBER);
            stat.registerOutParameter(4, OracleTypes.VARCHAR);
            stat.registerOutParameter(5, OracleTypes.VARCHAR);
            stat.registerOutParameter(6, OracleTypes.VARCHAR);
            
            
            stat.executeQuery();
            
            System.out.println(stat.getString(2));
            System.out.println(stat.getString(3));
            System.out.println(stat.getString(4));
            System.out.println(stat.getString(5));
            System.out.println(stat.getString(6));
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }

    private static void m3() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            String sql = "{call procM3(?)}";
            stat = conn.prepareCall(sql);
            
            //in parameter일 경우
            //stat.setString((1, "값");
            
            
            //jout parameter일 결루
            stat.registerOutParameter(1, OracleTypes.NUMBER);
            
            //일반 Select의 결과값 > ResultSet
            //Out Parameter 결과값 > ResultSet(X) > 다른 방식
            
            
            
//            rs = stat.executeQuery();
//            if(rs.next()) {
//                System.out.println(rs.getInt(1));
//            }else {
//                System.out.println("못가져왔음.");
//            }
//            
            
            stat.executeQuery();
            int count = stat.getInt(1); //stat.registerOutParameter(1)의 반대
            
            System.out.println(count);
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }        
    }

    private static void m2() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            
            String sql = "{call procM2(?, ?, ?, ?, ?)}";
            stat = conn.prepareCall(sql);
            
            stat.setString(1, "홍길이");
            stat.setInt(2, 2);
            stat.setString(3, "f");
            stat.setString(4, "010");
            stat.setString(5, "서울시");
            
            int result = stat.executeUpdate();
            System.out.println(result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }        
    }//m2

    private static void m1() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            
            //JDBC에서 SQL 실행 환경 > ANSI
            String sql ="{call procM1}";
            
            stat =conn.prepareCall(sql);
            int result = stat.executeUpdate();
            System.out.println(result);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }//m1

    private static void temp() {
        DBUtil util = new DBUtil();
        Connection conn = null;
        CallableStatement stat = null;
        ResultSet rs=null;
        
        try {
            conn = util.open();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }//temp
    
    
    
}//class
