package kr.ac.donga.daurp.service;

import java.util.List;
import java.util.Map;

/**
 * Example Service: UserService
 * 
 * @since 2018-02-01
 * @author hsjeon
 */
public interface UserService {

	List<Map<String, Object>> getList(Map<String, Object> req);

}
