package kr.ac.donga.daurp;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import kr.ac.donga.daurp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Example Controller: UserController
 * 
 * @since 2018-02-01
 * @author hsjeon
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	UserService uService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(
			Locale locale
		,	Model model
		,	@RequestParam(value="p", required=false, defaultValue="0") int nowPage
		,	@RequestParam(value="size", required=false, defaultValue="10") int listSize
			) {
		logger.info("User List! The client locale is {}.", locale);
		
		// Put parameters into request Map<>
		Map<String, Object> req = new HashMap<String, Object>();
		req.put("nowPage", nowPage);
		req.put("listSize", listSize);
		
		// Get result and add into Model
		model.addAttribute("list", uService.getList(req));
		
		return "tiles.user/list";
	}
}