CREATE TABLE member (
	user_no NUMBER NOT NULL CONSTRAINT member_pk PRIMARY KEY,
	user_id varchar(30) NOT NULL,
	user_pwd varchar2(100) NOT NULL,
	user_name varchar2(30) NOT NULL,
	email varchar2(100)	NOT NULL,
	phone varchar2(13),
	gender varchar2(1),
	age	number,
	address varchar2(100),
	enroll_date	date DEFAULT sysdate not null,
	user_level	number,
	pt varchar2(30),
	status varchar2(1) DEFAULT 'Y' NULL,
	api	varchar2(100),
	qr	varchar2(300)NOT NULL,
	profile_pic	varchar2(300),
	membership	varchar2(30),
    attendance varchar2(100)   
);
drop SEQUENCE seq_mno;
create sequence seq_mno start with 4 NOCACHE;

COMMENT ON COLUMN member.user_no IS '회원번호';
COMMENT ON COLUMN member.user_id IS '회원아이디';
COMMENT ON COLUMN member.user_pwd IS '회원비밀번호';
COMMENT ON COLUMN member.user_name IS '회원이름';
COMMENT ON COLUMN member.email IS '이메일';
COMMENT ON COLUMN member.phone IS '전화번호';
COMMENT ON COLUMN member.gender IS '성별';
COMMENT ON COLUMN member.age IS '나이';
COMMENT ON COLUMN member.address IS '주소';
COMMENT ON COLUMN member.enroll_date IS '가입일';
COMMENT ON COLUMN member.user_level IS '1 트레이너, 2회원';
COMMENT ON COLUMN member.pt IS '담당트레이너';
COMMENT ON COLUMN member.status IS 'Y, N';
COMMENT ON COLUMN member.api IS 'api로그인 키';
COMMENT ON COLUMN member.qr IS 'qr코드 발급후 저장 경로';
COMMENT ON COLUMN member.profile_pic IS '회원 프로필 사진';
COMMENT ON COLUMN member.membership IS '회원이 소유한 회원권';
comment on column member.attendance is '출결';

-- schedule table --
drop table schedule;
CREATE TABLE SCHEDULE (
    SCHEDULE_NO NUMBER NOT NULL,                 -- 스케줄 고유번호
    USER_NO NUMBER NOT NULL references member(user_no) , -- 스케줄 보유회원아이디
    SCHEDULE_TITLE VARCHAR2(100),                -- 스케줄이름
    SCHEDULE_DES VARCHAR2(3000),                 -- 스케줄 내용
    START_DATE varchar2(100),                  -- 시작 날짜
    END_DATE varchar2(100),                     -- 종료날짜
    DOW VARCHAR2(30),                             -- 요일                              
    back_color varchar2(30),                    -- 배경색
    allday varchar2(10)                         -- 종일 일정 여부
);
drop sequence seq_cno;
create sequence seq_cno nocache;

drop table qrInfo;
create table qrInfo (
    qr_no number constraint qr_pk PRIMARY key,
    id varchar2(30),
	type varchar2(30),
	created_at varchar2(100),
	valid_until varchar2(100),
	attendance varchar2(30),
	status varchar2(30) DEFAULT 'Y', -- 유효 여부
    att_status varchar2(30) -- 출결 상태
)
;

drop sequence seq_qno;
create sequence seq_qno nocache;

