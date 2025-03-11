--

--DDL
create table tblMemo(
    seq number primary key,                 -- pk
    name varchar2(30) not null,             -- 작성자
    pw varchar2(30) not null,               -- 암호
    memo varchar2(2000) not null,           -- 메모
    regdate date default sysdate not null   -- 작성일
);
create sequence seqMemo;


--DML
--메모 쓰기
insert into tblMemo(seq,name,pw,memo,regdate)
    values(seqMemo.nextVal,'홍길동','1111','메모입니다.',default);
    
-- 메모 목록 보기
select * from tblMemo order by seq desc;

-- 작성자 확인하기? > 왜 count?? > 5번글 삭제 시도 > 5번글의 암호 입력 > count가 1이명 허락. 0이면 비번이 틀린것이니 허락 안함
select count(*) as cnt from tblMemo where seq=1 and pw= '1111';

-- 메모 수정하기
update tblMemo set memo = '수정된내용입니다' where seq=1;

--메모 삭제하기
delete from tblMemo where seq=1;

commit;