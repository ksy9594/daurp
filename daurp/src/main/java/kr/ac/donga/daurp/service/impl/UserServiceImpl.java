package kr.ac.donga.daurp.service.impl;

import java.util.List;
import java.util.Map;

import kr.ac.donga.daurp.service.UserService;
import org.springframework.stereotype.Service;

import ngel.core.service.AbstractCommonService;

/**
 * Example Service Implements: UserServiceImpl
 * 
 * @since 2018-02-01
 * @author hsjeon
 */
@Service
public class UserServiceImpl extends AbstractCommonService implements UserService {
	
	@Override
	public List<Map<String, Object>> getList(Map<String, Object> req) {
		return mapper.select("User.getList", req);
	}
	
}
