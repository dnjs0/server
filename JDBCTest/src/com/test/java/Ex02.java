package com.test.java;

import java.sql.Connection;

public class Ex02 {
    public static void main(String[] args) {
        /*
            접속시 발생하는 에러
            1. 서버 주소 X
            - java.sql.SQLRecoverableException: IO 오류: The Network Adapter could not establish the connection
            
            2. 아아디 X, 암호 X
            - java.sql.SQLException: ORA-01017: 사용자명/비밀번호가 부적합, 로그온할 수 없습니다.
            
            3. 서버 중지
            - 1번과 동일
            
            4. 연결 문자열 오타
            - java.sql.SQLException: 부적합한 Oracle URL이 지정되었습니다
            
            5. 포트번호 X
            - 1번과 동일
            
            6. SID X
            - ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
            
            7. Driver X (oracleDriver -> OracleDriver)
            - java.lang.ClassNotFoundException: oracle.jdbc.driver.oracleDriver
            
            8. jar X
            - java.lang.ClassNotFoundException: oracle.jdbc.driver.OracleDriver
            
         
         */
        
        Connection conn = null;
        DBUtil util = new DBUtil();
        
        conn = util.open();
        
        try {
            System.out.println(conn.isClosed());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }//main
}//class
