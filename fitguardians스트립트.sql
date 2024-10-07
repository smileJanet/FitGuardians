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
	membership	varchar2(30)
);

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

drop SEQUENCE seq_mno;
create sequence seq_mno start with 4 NOCACHE;

drop table schedule;
CREATE TABLE SCHEDULE (
    SCHEDULE_NO NUMBER NOT NULL,                 -- ������ ������ȣ
    USER_NO NUMBER NOT NULL references member(user_no) ,                     -- ������ ����ȸ�����̵�
    SCHEDULE_TITLE VARCHAR2(100),                -- �������̸�
    SCHEDULE_DES VARCHAR2(3000),                 -- ������ ����
    START_DATE varchar2(100),             
    END_DATE varchar2(100),                               -- ���ᳯ¥
    DOW VARCHAR2(30),                             -- ����
    bgc varchar2(30),
    back_color varchar2(30)
);



create sequence seq_cno nocache;



