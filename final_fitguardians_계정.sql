INSERT INTO member (user_no, user_id, user_pwd, user_name, email, phone, gender, age, address, enroll_date, user_level, pt, status, api, qr, profile_pic, membership)
VALUES
(1, 'user01', 'Password!1', '김민수', 'minsu.kim@example.com', '01012345678', 'M', 25, '서울시 강남구 123', SYSDATE, 1, 'Trainer A', 'Y', 'api_key_1', 'qr_code_path_1', 'profile_pic_path_1', 'Gold Membership'),

(2, 'user02', 'SecurePassword2!', '이수진', 'sujin.lee@example.com', '01098765432', 'F', 30, '부산시 해운대구 456', SYSDATE, 2, 'Trainer B', 'Y', 'api_key_2', 'qr_code_path_2', 'profile_pic_path_2', 'Silver Membership'),

(3, 'user03', 'StrongPwd3$', '박지현', 'jihyun.park@example.com', '01045678910', 'F', 28, '대전시 유성구 789', SYSDATE, 2, 'Trainer C', 'Y', 'api_key_3', 'qr_code_path_3', 'profile_pic_path_3', 'Platinum Membership');


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