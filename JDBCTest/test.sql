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




