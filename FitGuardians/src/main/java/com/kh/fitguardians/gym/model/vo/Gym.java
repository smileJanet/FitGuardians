package com.kh.fitguardians.gym.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Gym {
	
	private int gymNo;     // 헬스장 번호 (int)
    private int gymName;   // 헬스장 이름 (int)
    private String gymAddress; // 헬스장 주소 (String)
}
