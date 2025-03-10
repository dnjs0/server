-- 새 계정 생성

--확인하기
/*
1.serveice.msc
- OracleService XXE
- OrecleDraDB21Home1TNSListener

*/


show user; --USER이(가) "SYSTEM"입니다.


alter session set "_ORACLE_SCRIPT"=true;
create user server identified by java1234;
grant connect, resource, dba to server;
alter user server default tablespace users;
-- 새접속 -> 이름: localhost.server, 비번: java1234
