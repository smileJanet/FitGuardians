package com.kh.tripvibe.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {

		// 원본파일명
		String originName = originFile.getName();
		
		// 수정된 파일명 = 파일 업로드 시간(년월일시분초 + 5자리 랜덤값 + 원본파일확장자)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
		// 5자리 랜덤값
		int ranNum = (int)(Math.random()*901000+10000);
		
		// 원본 파일 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 다 합친 하나뿐인 파일 이름
		String changeName = currentTime + ranNum + ext;
		
		// origin파일을 똑같이 복제해서 만들고 이름만 changeName으로 바꿈
		return new File(originFile.getParent(), changeName);
	}
	
}
