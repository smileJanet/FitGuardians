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
create sequence seq_mno NOCACHE;

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

-- member samlpe 
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user01', 'Password!1', '김민수', 'minsu.kim@example.com', '01012345678', 'M', 25, '서울시 강남구 123', SYSDATE, 1, 'Trainer A', 'Y', 'api_key_1', 'qr_code_path_1', 'profile_pic_path_1', 'Gold Membership');
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user02', 'SecurePassword2!', '이수진', 'sujin.lee@example.com', '01098765432', 'F', 30, '부산시 해운대구 456', SYSDATE, 2, 'Trainer B', 'Y', 'api_key_2', 'qr_code_path_2', 'profile_pic_path_2', 'Silver Membership');
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user03', 'StrongPwd3$', '박지현', 'jihyun.park@example.com', '01045678910', 'F', 28, '대전시 유성구 789', SYSDATE, 2, 'Trainer C', 'Y', 'api_key_3', 'qr_code_path_3', 'profile_pic_path_3', 'Platinum Membership');

commit;
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

COMMENT ON COLUMN SCHEDULE.SCHEDULE_NO IS '스케줄 고유번호';
COMMENT ON COLUMN SCHEDULE.USER_NO IS '스케줄 보유회원 아이디';
COMMENT ON COLUMN SCHEDULE.SCHEDULE_TITLE IS '스케줄 이름';
COMMENT ON COLUMN SCHEDULE.SCHEDULE_DES IS '스케줄 내용';
COMMENT ON COLUMN SCHEDULE.START_DATE IS '시작 날짜';
COMMENT ON COLUMN SCHEDULE.END_DATE IS '종료 날짜';
COMMENT ON COLUMN SCHEDULE.DOW IS '요일';
COMMENT ON COLUMN SCHEDULE.BACK_COLOR IS '배경색';
COMMENT ON COLUMN SCHEDULE.ALIDAY IS '종일 일정 여부';

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

COMMENT ON COLUMN qrInfo.qr_no IS 'QR 코드 고유 번호';
COMMENT ON COLUMN qrInfo.id IS '사용자 ID';
COMMENT ON COLUMN qrInfo.type IS '사용자 타입';
COMMENT ON COLUMN qrInfo.created_at IS '생성 일시';
COMMENT ON COLUMN qrInfo.valid_until IS '유효 기간';
COMMENT ON COLUMN qrInfo.attendance IS '출석 정보';
COMMENT ON COLUMN qrInfo.status IS '유효 여부 (기본값: Y)';
COMMENT ON COLUMN qrInfo.att_status IS '출결 상태';
