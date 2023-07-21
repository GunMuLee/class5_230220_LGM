package com.self.study.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.self.study.vo.MemberVO;

@Mapper
public interface LoginMapper {

	int insertMember(@Param("id") String id,@Param("passwd") String passwd);

	MemberVO selectMembers(@Param("id") String id,@Param("passwd") String passwd);

}
