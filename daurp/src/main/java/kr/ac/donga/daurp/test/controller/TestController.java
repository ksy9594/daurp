package kr.ac.donga.daurp.test.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import kr.ac.donga.daurp.UserController;
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
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService uService;

    @RequestMapping(value = "/PopupApi/Sample", method = RequestMethod.GET)
    public String Sample(
            Locale locale
            ,	Model model
    ) {
        logger.info("User List! The client locale is {}.", locale);

        model.addAttribute("Sample", "Test");

        return "PopupApi/Sample";
    }
    @RequestMapping(value = "/PopupApi/jusoPopup")
    public String Popup(
            Locale locale
            ,	Model model
    ) {
        logger.info("User List! The client locale is {}.", locale);

        model.addAttribute("PopupApi", "Test");

        return "/PopupApi/jusoPopup";
    }

}