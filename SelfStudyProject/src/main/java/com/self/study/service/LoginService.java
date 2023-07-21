package com.self.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.self.study.mapper.LoginMapper;
import com.self.study.vo.MemberVO;

@Service
public class LoginService {
	
	@Autowired
	LoginMapper mapper;

	public int insertMember(String id, String passwd) {
		return mapper.insertMember(id, passwd);
	}

	public MemberVO getMembers(String id, String passwd) {
		return mapper.selectMembers(id, passwd);
	}

}
