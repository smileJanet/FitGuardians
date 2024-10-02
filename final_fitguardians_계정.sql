INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(1, 'user01', 'Password!1', '��μ�', 'minsu.kim@example.com', '01012345678', 'M', 25, '����� ������ 123', SYSDATE, 1, 'Trainer A', 'Y', 'api_key_1', 'qr_code_path_1', 'profile_pic_path_1', 'Gold Membership'),

(2, 'user02', 'SecurePassword2!', '�̼���', 'sujin.lee@example.com', '01098765432', 'F', 30, '�λ�� �ؿ�뱸 456', SYSDATE, 2, 'Trainer B', 'Y', 'api_key_2', 'qr_code_path_2', 'profile_pic_path_2', 'Silver Membership'),

(3, 'user03', 'StrongPwd3$', '������', 'jihyun.park@example.com', '01045678910', 'F', 28, '������ ������ 789', SYSDATE, 2, 'Trainer C', 'Y', 'api_key_3', 'qr_code_path_3', 'profile_pic_path_3', 'Platinum Membership');


INSERT 
		  INTO member 
		     ( user_no
		     , user_id
		     , user_pwd
		     , user_name
		     , email
		     , phone
		     , gender
		     , age
		     , address
		     , user_level
		     , qr
		     )
        VALUES
        	 (
        	   seq_mno.nextval
        	 , #{userId}
        	 , #{userPwd}
        	 , #{userName}
        	 , #{email}
        	 , #{phone}
        	 , #{gender}
        	 , #{age}
        	 , #{address}
        	 , #{userLevel} 
        	 , 'qr_code_path_1'
        	 )