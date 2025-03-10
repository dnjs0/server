package com.test.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex04_select {
    public static void main(String[] args) {
        //Ex04_select
//        m1();
//        m2();
//        m3();
//        m4();
//        m5();
//        m6();
//        m7();
//        m8();
        m9();
        
    }//main
    
    private static void m9() {
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        DBUtil util = new DBUtil();
        
        try {
            conn = util.open("localhost","hr","java1234");
            stat = conn.createStatement();
            
            
            String sql = "select * from tblInsa where buseo = '영업부'";
            rs = stat.executeQuery(sql);
            
            //결과셋(rs)의 레코드 수를 알아내기?
            // > 불가능 !!! > count를 직접 누적해야한다.
            
            int count = 0;
            
            while(rs.next()) {
                System.out.println(rs.getString("name"));
                count ++;
            }
            rs.close();
            System.out.println("인원수 : "+count);
            
            stat.close();
            conn.close();
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        
    }

    private static void m8() {
        // 요구사항 ]  영업부 > 직원수와 직원 명단을 출력하시요
        
        //1. select count(*) from tblInsa where buseo='영업부'
        //2. select * from tblInsa where buseo='영업부'
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        DBUtil util = new DBUtil();
        
        try {
            conn = util.open("localhost","hr","java1234");
            stat = conn.createStatement();
            
            String sql = "select count(*) as cnt from tblInsa where buseo='영업부'";
            rs = stat.executeQuery(sql);
            
            if(rs.next()) {
                System.out.println("인원수 : "+rs.getString("cnt"));
            }else {
                System.out.println("카운트 실패;;");
            }
            
            rs.close();
            
            sql = "select * from tblInsa where buseo = '영업부'";
            rs = stat.executeQuery(sql);
            
            while(rs.next()) {
                System.out.println(rs.getString("name"));
            }
            rs.close();
            stat.close();
            conn.close();
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        
    }

    private static void m7() {
        // 요구사항 ] 특정직원에게 보너스를 지급하시오.
        //- tblInsa + tblBonus
        //1. 모든 직원 명단 출력하기(tblInsa >직원번호, 이름, 부서, 직위) > m6 참고(select .. tblInsa)
        //2. 사용자로붙터 보너스를 지급할 직원의 번호 입력(scan.nextLine())
        //3. 사용자로부터 보너스 금액을 입력(scan.nextLine())
        //4. 보너스 지금(insert tblBonus) > ex03_m6()참조
        //5. 지급된 내역을 출력하시요.(select .. tblBonus > 직원번호, 이름, 부서. 직위, 보너스 금액) >inner join >ex04_m6()참조
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        DBUtil util = new DBUtil();
        
        try {
            conn = util.open("localhost","hr","java1234");
            stat = conn.createStatement();
            
                
            //1. 모든 직원 명단을 출력하기
            String sql ="select * from tblInsa order by num asc";
            rs = stat.executeQuery(sql);
            
            while(rs.next()) {
                System.out.printf("%s, %s, %s, %s\r\n"
                                ,rs.getString("num")
                                ,rs.getString("name")
                                ,rs.getString("buseo")
                                ,rs.getString("jikwi"));
            }
            rs.close();
                
            
            //보너스 지급하기~
            Scanner scan = new Scanner(System.in);
            
            System.out.println("---------------------------------");
            System.out.print("보너스를 지급할 직원의 번호 : ");
            String bonus_num = scan.nextLine();
            
            System.out.print("보너스 금액 입력 : ");
            String bonus_amount = scan.nextLine();
            
            sql = String.format("insert into tblBonus(seq, num, bonus) values(seqBonus.nextVal,%s,%s)", bonus_num ,bonus_amount);
            if(stat.executeUpdate(sql)>0) {
                //지급 완료
              
                //join으로 출력하기~~
                sql = """
                        select i.num, i.name, i.buseo, i.jikwi, t.bonus, t.seq tseq
                        from tblInsa i
                        inner join tblBonus t on t.num=i.num
                        order by t.seq desc
                        """;
                rs = stat.executeQuery(sql);
                System.out.println("---------------------------------");
                while(rs.next()) {
                    System.out.printf("%s, %s, %s, %s, %s원 %s\n"
                                    ,rs.getString("num")
                                    ,rs.getString("name")
                                    ,rs.getString("buseo")
                                    ,rs.getString("jikwi")
                                    ,rs.getString("bonus")
                                    ,rs.getString("tseq"));
                }
                rs.close();
                
            }else {
                //지급실패
                System.out.println("지급 실패;;");
                
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

    private static void m6() {
        //insert > select 
        //주소록 데이터 입력 > 주소록 명단 출력하기
        Scanner scan = new Scanner(System.in);
        
        System.out.print("이름 : ");
        String name = scan.nextLine();
        
        System.out.print("나이 : ");
        String age = scan.nextLine();
        
        System.out.print("성별(m,f) : ");
        String gender = scan.nextLine();
        
        System.out.print("전화번호 : ");
        String tel = scan.nextLine();
        
        System.out.print("주소 : ");
        String address = scan.nextLine();
        address = address.replace("'", "''"); //길동's 하우스 > 길동''s 하우스
        
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        DBUtil util = new DBUtil();
        
        try {
            conn = util.open();
            stat = conn.createStatement();
            
            String sql = String.format("insert into tblAddress(seq, name, age, gender, tel, address, regdate) values(seqAddress.nextVal, '%s',%s,'%s','%s','%s',default)", name,age, gender,tel,address);
            
            int result = stat.executeUpdate(sql);

            if(result > 0) {
                
                //N행 N열 가져오기
                sql ="select * from tblAddress order by seq desc";
                rs = stat.executeQuery(sql);
                
                while(rs.next()) {
                    System.out.printf("%s, %s, %s, %s\r\n"
                                    ,rs.getString("seq")
                                    ,rs.getString("name")
                                    ,rs.getString("gender")
                                    ,rs.getString("age"));
                }
                rs.close();//커서가 끝ㅌ까지 다 돌았으므로 닫음
                
            }else {
                System.out.println("추가 실패 ;;");
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

    private static void m5() {
        // 부서명 입력 > 직원 명단 출력
        Scanner scan = new Scanner(System.in);
        DBUtil util = new DBUtil();
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = util.open("localhost","hr","java1234");
            stat = conn.createStatement();
            
            //부서명 ??? 입력 ? 
            // > 미리 부서명 가져와서 알려주기
            String sql = "select distinct buseo from tblInsa order by buseo asc";
            rs = stat.executeQuery(sql);
            
            System.out.println("보고 싶은 부서명을 입력하세요");
            while (rs.next()) {
                System.out.println("- " + rs.getString("buseo"));
            }
            
            
            //부서명 목록 닫기,select 하나당 rs하나 이므로 하나만 닫기
            rs.close(); 
            
            
            
            
            
            System.out.print("부서명 : ");
            String buseo = scan.nextLine();
            
            sql = String.format("select name from tblInsa where buseo='%s' order by name asc", buseo);
            
            //rs 재사용
            rs =stat.executeQuery(sql);
            
            while(rs.next()) {
                System.out.println(rs.getString("name"));
            }
            
            rs.close();//직원 명단 목록 닫기
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                stat.close(); //더이상 SQL실행할 일이 없으면 닫는다.
                conn.close(); //접속이 필요없을때 닫는다.
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
    }

    private static void m4() {
        //다중값 반환
        //- N행 1열
        DBUtil util = new DBUtil();
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = util.open();
            stat =conn.createStatement();
            
            String sql = "select name from tblAddress order by name";
            //결과셋의 참조, 화살표(커서)일뿐 (결과 테이블 그 자체가 아님!!)
             rs = stat.executeQuery(sql);
             
             rs.next();
             String name = rs.getString("name");
             System.out.println(name);
             System.out.println(name);
             System.out.println(rs.getString("name"));
             
             rs.next();
             System.out.println(rs.getString("name"));
             System.out.println("----------------------------");
             
             //나머지만 돈다(이미 커서가 움직였으면 그 후 부터 출력, 처음부터 돌지 않는다.)
             while(rs.next()) {
                 name = rs.getString("name");
             System.out.println(name); }
              
             System.out.println("----------------");
             //java.sql.SQLException: 마지막 행 다음의 결과 집합 -> 커서 에러!!
             rs.next(); //커서가 다 돌았으므로 error
             System.out.println(rs.getString("name"));
             
             
             
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stat.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static void m3() {
        //여러개 가져오기
        DBUtil util = new DBUtil();
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = util.open();
            stat =conn.createStatement();
            
            String sql = "select * from tblAddress where seq=1";
             rs = stat.executeQuery(sql);
             
             //address 틀렸을때..
             //java.sql.SQLException: 부적합한 열 이름 > 자바에러
             //ORA-XXXX 오류 : 쿼리 문제
             
             if(rs.next()) {
                 String name= rs.getString("name");
                 String age = rs.getString("age");
                 String address = rs.getString("address");
                 
                 System.out.println(name);
                 System.out.println(age);
                 System.out.println(address);
                 
             }else {
                 System.out.println("not found");
             }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stat.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
    }

    private static void m2() {
        //단일값 반환
        //1행 1열
        DBUtil util = new DBUtil();
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = util.open();
            stat =conn.createStatement();
            
            String sql = "select name from tblAddress where seq=1"; //seq=10인 사람 없음 > error
            
            //결과 셋의 참조 객체
            rs = stat.executeQuery(sql); //BOF (시작점 가리키는중)
            
            if(rs.next()) { //문제 발생 가능(**)
            
                //java.sql.SQLException: 마지막 행 다음의 결과 집합 > EoF 
                String name = rs.getString("name"); //문제 발생 !!
                System.out.println(name);
            }else {
                System.out.println("데이터 없음");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stat.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
        
    }
    
    private static void m1() {
        //단일값 반환
        //1행 1열
        DBUtil util = new DBUtil();
        Connection conn= null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = util.open();
            stat =conn.createStatement();
            
            String sql = "select count(*) as cnt from tblAddress";
            
            //결과 셋의 참조 객체
            rs = stat.executeQuery(sql); //BOF (시작점 가리키는중)
            
            rs.next(); //커서 레코드 1줄 전진
            
            //현재 커서가 가르키고 있는 레코드의 원하는 컬럼 가져오기
            //rs.getXXX()
            
            //int count = rs.getInt(1);//index 1부터 시작
            //int count = rs.getInt("count(*)"); //이런짓은 ㄴㄴ
            //int count = rs.getInt("cnt"); //컬럼명(별명)으로 주로 함(***)
            String count = rs.getString("cnt");
            System.out.println(count);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stat.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
        
    }
    
}//class
