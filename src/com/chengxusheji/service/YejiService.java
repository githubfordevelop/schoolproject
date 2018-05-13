package com.chengxusheji.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chengxusheji.mapper.UserInfoMapper;
import com.chengxusheji.mapper.YejiMapper;
import com.chengxusheji.po.Yeji;

@Service
public class YejiService {
	@Resource YejiMapper yejiMapper;
	public void insertById(Yeji yeji1) throws Exception {
		
		int i=yejiMapper.insertById(yeji1);
		if(i<1) {
			throw new Exception();
		}
	}

}
