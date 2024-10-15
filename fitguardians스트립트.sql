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

COMMENT ON COLUMN member.user_no IS 'ȸ����ȣ';
COMMENT ON COLUMN member.user_id IS 'ȸ�����̵�';
COMMENT ON COLUMN member.user_pwd IS 'ȸ����й�ȣ';
COMMENT ON COLUMN member.user_name IS 'ȸ���̸�';
COMMENT ON COLUMN member.email IS '�̸���';
COMMENT ON COLUMN member.phone IS '��ȭ��ȣ';
COMMENT ON COLUMN member.gender IS '����';
COMMENT ON COLUMN member.age IS '����';
COMMENT ON COLUMN member.address IS '�ּ�';
COMMENT ON COLUMN member.enroll_date IS '������';
COMMENT ON COLUMN member.user_level IS '1 Ʈ���̳�, 2ȸ��';
COMMENT ON COLUMN member.pt IS '���Ʈ���̳�';
COMMENT ON COLUMN member.status IS 'Y, N';
COMMENT ON COLUMN member.api IS 'api�α��� Ű';
COMMENT ON COLUMN member.qr IS 'qr�ڵ� �߱��� ���� ���';
COMMENT ON COLUMN member.profile_pic IS 'ȸ�� ������ ����';
COMMENT ON COLUMN member.membership IS 'ȸ���� ������ ȸ����';
comment on column member.attendance is '���';

-- member samlpe 
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user01', 'Password!1', '��μ�', 'minsu.kim@example.com', '01012345678', 'M', 25, '����� ������ 123', SYSDATE, 1, 'Trainer A', 'Y', 'api_key_1', 'qr_code_path_1', 'profile_pic_path_1', 'Gold Membership');
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user02', 'SecurePassword2!', '�̼���', 'sujin.lee@example.com', '01098765432', 'F', 30, '�λ�� �ؿ�뱸 456', SYSDATE, 2, 'Trainer B', 'Y', 'api_key_2', 'qr_code_path_2', 'profile_pic_path_2', 'Silver Membership');
INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(seq_mno.nextval, 'user03', 'StrongPwd3$', '������', 'jihyun.park@example.com', '01045678910', 'F', 28, '������ ������ 789', SYSDATE, 2, 'Trainer C', 'Y', 'api_key_3', 'qr_code_path_3', 'profile_pic_path_3', 'Platinum Membership');

commit;
-- schedule table --
drop table schedule;
CREATE TABLE SCHEDULE (
    SCHEDULE_NO NUMBER NOT NULL,                 -- ������ ������ȣ
    USER_NO NUMBER NOT NULL references member(user_no) , -- ������ ����ȸ�����̵�
    SCHEDULE_TITLE VARCHAR2(100),                -- �������̸�
    SCHEDULE_DES VARCHAR2(3000),                 -- ������ ����
    START_DATE varchar2(100),                  -- ���� ��¥
    END_DATE varchar2(100),                     -- ���ᳯ¥
    DOW VARCHAR2(30),                             -- ����                              
    back_color varchar2(30),                    -- ����
    allday varchar2(10)                         -- ���� ���� ����
);
drop sequence seq_cno;
create sequence seq_cno nocache;

COMMENT ON COLUMN SCHEDULE.SCHEDULE_NO IS '������ ������ȣ';
COMMENT ON COLUMN SCHEDULE.USER_NO IS '������ ����ȸ�� ���̵�';
COMMENT ON COLUMN SCHEDULE.SCHEDULE_TITLE IS '������ �̸�';
COMMENT ON COLUMN SCHEDULE.SCHEDULE_DES IS '������ ����';
COMMENT ON COLUMN SCHEDULE.START_DATE IS '���� ��¥';
COMMENT ON COLUMN SCHEDULE.END_DATE IS '���� ��¥';
COMMENT ON COLUMN SCHEDULE.DOW IS '����';
COMMENT ON COLUMN SCHEDULE.BACK_COLOR IS '����';
COMMENT ON COLUMN SCHEDULE.ALIDAY IS '���� ���� ����';

drop table qrInfo;
create table qrInfo (
    qr_no number constraint qr_pk PRIMARY key,
    id varchar2(30),
	type varchar2(30),
	created_at varchar2(100),
	valid_until varchar2(100),
	attendance varchar2(30),
	status varchar2(30) DEFAULT 'Y', -- ��ȿ ����
    att_status varchar2(30) -- ��� ����
)
;

drop sequence seq_qno;
create sequence seq_qno nocache;

COMMENT ON COLUMN qrInfo.qr_no IS 'QR �ڵ� ���� ��ȣ';
COMMENT ON COLUMN qrInfo.id IS '����� ID';
COMMENT ON COLUMN qrInfo.type IS '����� Ÿ��';
COMMENT ON COLUMN qrInfo.created_at IS '���� �Ͻ�';
COMMENT ON COLUMN qrInfo.valid_until IS '��ȿ �Ⱓ';
COMMENT ON COLUMN qrInfo.attendance IS '�⼮ ����';
COMMENT ON COLUMN qrInfo.status IS '��ȿ ���� (�⺻��: Y)';
COMMENT ON COLUMN qrInfo.att_status IS '��� ����';

-- ȸ���߰����� ���̺�
CREATE TABLE MEMBER_INFO(
    USER_NO NUMBER PRIMARY KEY, --ȸ����ȣ
    HEIGHT NUMBER, --ȸ��Ű
    WEIGHT NUMBER, --������
    DISEASE VARCHAR2(100), --������ȯ
    GOAL VARCHAR2(100), --���ǥ
    CONSTRAINT FK_USER_NO FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE 
);
COMMENT ON COLUMN MEMBER_INFO.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER_INFO.HEIGHT IS 'ȸ��Ű';
COMMENT ON COLUMN MEMBER_INFO.WEIGHT IS '������';
COMMENT ON COLUMN MEMBER_INFO.DISEASE IS '������ȯ';
COMMENT ON COLUMN MEMBER_INFO.GOAL IS '���ǥ';
<<<<<<< HEAD
=======

------�߰� ���̺�

-- ȸ���� ���̺�
CREATE TABLE MEMBERSHIP (
	MEMBERSHIP_NO NUMBER CONSTRAINT PK_MEMBERSHIP PRIMARY KEY,
	MEMBERSHIP_LEVEL NUMBER DEFAULT 0 NOT NULL,
	MEMBERSHIP_NAME	VARCHAR2(30) NOT NULL,
	MEMBERSHIP_PERIOD VARCHAR2(30) NOT NULL,
	MEMBERSHIP_DESC	varchar2(3000) NULL
);

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_NO IS 'ȸ���� ������ȣ';

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_LEVEL IS '0 : ���� 1: ���� ȸ���� 2: �߰� ȸ���� 3: ���� ȸ����';

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_NAME IS 'ȸ���� �̸�';

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_PERIOD IS 'ȸ���� �Ⱓ';

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_DESC IS 'ȸ���� ����';

-- ȸ���� ������ȣ ���� ������
CREATE SEQUENCE SEQ_MEMBERSHIP NOCACHE;


-- ȸ���� ��û ���̺�
CREATE TABLE MEMBER_APPLICATION (
    APPLICATION_NO NUMBER CONSTRAINT PK_MEMBER_APPLICATION PRIMARY KEY,
    USER_NO NUMBER NOT NULL,
    MEMBERSHIP_NO NUMBER NOT NULL,
    APPLICATION_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT FK_USER_TO_MEMBER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    CONSTRAINT FK_MEMBERSHIP_TO_MEMBER FOREIGN KEY (MEMBERSHIP_NO) REFERENCES MEMBERSHIP(MEMBERSHIP_NO)
);

COMMENT ON COLUMN MEMBER_APPLICATION.APPLICATION_NO IS '��û ��� ���� ��ȣ';
COMMENT ON COLUMN MEMBER_APPLICATION.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER_APPLICATION.MEMBERSHIP_NO IS 'ȸ���� ������ȣ';
COMMENT ON COLUMN MEMBER_APPLICATION.APPLICATION_DATE IS '��û ��¥';
COMMENT ON COLUMN MEMBER_APPLICATION.STATUS IS '�Ⱓ ���� ''N''';


-- ȸ���� ��û ������ȣ ���� ������
CREATE SEQUENCE SEQ_MEMBERSHIP_APPLICATION NOCACHE;

-- Ʈ���̳� ��Ī ���̺�
CREATE TABLE TRAINER_MATCHING (
    MATCHING_NO NUMBER CONSTRAINT PK_TRAINER_MATCHING PRIMARY KEY NOT NULL,
    USER_NO NUMBER NOT NULL,
    TRAINER_NO NUMBER NOT NULL,
    CONSTRAINT FK_USER_TO_TRAINER_MATCHING FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    CONSTRAINT FK_TRAINER_TO_TRAINER_MATCHING FOREIGN KEY (TRAINER_NO) REFERENCES TRAINER_INFO (USER_NO)
);

COMMENT ON COLUMN TRAINER_MATCHING.MATCHING_NO IS '��Ī��ϰ�����ȣ';
COMMENT ON COLUMN TRAINER_MATCHING.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TRAINER_MATCHING.TRAINER_NO IS 'Ʈ���̳ʹ�ȣ';

-- Ʈ���̳� ��Ī ������

CREATE SEQUENCE SEQ_TRAINER_MATCHING NOCACHE;

drop table trainerinfo;
--- Ʈ���̳� ����
CREATE TABLE trainerInfo (
    user_no NUMBER NOT NULL,                     -- ȸ����ȣ
    tr_career NUMBER,                            -- ��� ���
    tr_certi varchar2(100),                      -- �ڰ� ����
    tr_profile VARCHAR2(300),                    -- ������ ���+���ϸ�
    tr_descript varchar2(1000)                   -- ���� �Ұ�
);

drop sequence seq_trainer_info;


>>>>>>> 0a7998ddf659c2159ef1594c24f904508cb294a9
