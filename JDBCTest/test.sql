--주소록 테이블
create table tblAddress(
    seq number primary key,                                 --PK
    name varchar2(30) not null,                             --이름
    age number(3) not null check(age between 0 and 120),    --나이
    gender char(1) not null check(gender in ('m','f')),     --성별(m,f)
    tel varchar2(15) not null,                              --전화번호
    address varchar2(300) not null,                         --주소
    regdate date default sysdate not null                   --날짜
);

drop table tblAddress;
create sequence seqAddress;
drop sequence seqAddress;

--업무  SQL > 미리 작성해놓기 > 1. DB테스트, 2. JDBC 작업 용이
insert into tblAddress(seq, name, age, gender, tel, address, regdate)
    values(seqAddress.nextVal, '홍길동',20,'m','010-1234-5678','서울시 강남구 역삼동',default);

--CRUD
select * from tblAddress 
    order by regdate;
delete tblAddress where seq=1;

update tblAddress set age = age+1 where seq = 1;
update tblAddress set address = '서울시 강동구 천호동' where seq =1;


commit;

--hr 로 연결
show user;
select * from tabs;

select * from tblInsa;
select name from tblInsa where buseo='기획부';

select * from tblBonus;

create table tblBonus(
    seq number primary key,
    num number(5) not null references tblInsa(num), --직원 번호
    bonus number not null
);
drop sequence seqBonus;
create sequence seqBonus;

select i.num, i.name, i.buseo, i.jikwi, t.bonus
from tblInsa i
inner join tblBonus t on t.num=i.num;


select count(*) as cnt from tblInsa where buseo='영업부';



select * from tblInsa where buseo = '영업부';


--localhost.server로 연결
--E06.java

--m1. 인자값X 반환값X
create or replace procedure procM1
is
begin

end procM1;
/



--프로시저 호출(pl/sql)
begin
    procM1;
end;
/

--프로시저 호출(ansi)
execute procM1; --오라클 문법(벤더에 따라 다르게 지원)
exec procM1;
call procM1; --표준 문법(ANSI)

select * from tblAddress;



create or replace procedure procM1
is
begin
    insert into tblAddress(seq, name, age, gender, tel, address, regdate)
        values(seqAddress.nextVal, '칙촉이',20,'m','010-1234-5678','서울시 강남구 역삼동',default);
end procM1;
/


delete from tblAddress;
select * from tblAddress;



--m2 : 인자값O, 반환값X

create or replace procedure procM2(
    pname varchar2,
    page number,
    pgender varchar2,
    ptel varchar2,
    paddress varchar2
    )
is
begin
    insert into tblAddress(seq, name, age, gender, tel, address, regdate)
        values(seqAddress.nextVal, pname, page, pgender, ptel, paddress,default);
end procM2;
/


-- 호출
begin
    procM2('강아지',2,'f','010','서울시');
end;
/

select * from tblAddress;





--m3 : 인자값X 반환값O
create or replace procedure procM3(
    pcount out number
)
is
begin
    select count(*) into pcount from tblAddress;
end procM3;
/

--호출
set serveroutput on;

declare
    vcount number;
begin
    procM3(vcount);
    dbms_output.put_line(vcount);
end;
/

select * from tblAddress;




--m4 : 인자값O, 반환값O
create or replace procedure procM4(
    pseq        in number,
    pname       out varchar2,
    page        out number,
    pgender     out varchar2,
    ptel        out varchar2,
    paddress    out varchar2
)
is
begin
    select name, age, gender, tel, address into  pname, page, pgender, ptel, paddress
        from tblAddress where seq=pseq;
end procM4;
/


select * from tblAddress;



--m5 커서 반환
create or replace procedure procM5(
    pgender in varchar2,
    pcursor out sys_refcursor
)
is
begin
    open pcursor
    for
    select * from tblAddress where gender = pgender;
end procM5;
/


--호출
declare 
    vcursor sys_refcursor;
    vrow tblAddress%rowtype;
begin
    procM5('m',vcursor);
    
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        dbms_output.put_line(vrow.name ||','||vrow.gender);
    end loop;
end;
/







create or replace procedure procM2
is
begin

end procM2;
/













