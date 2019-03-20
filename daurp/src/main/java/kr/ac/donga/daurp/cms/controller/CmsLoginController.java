package kr.ac.donga.daurp.cms.controller;

import egovframework.rte.fdl.security.userdetails.EgovUserDetails;
import kr.ac.donga.daurp.cms.service.CmsLoginService;
import ngel.core.web.FrameworkController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@Controller
public class CmsLoginController extends FrameworkController {

    @Autowired
    private CmsLoginService cmsLoginService;

    private static final Logger logger = LoggerFactory.getLogger(CmsLoginController.class);

    @RequestMapping(value = "/login/Login", method = RequestMethod.GET)
    public String home(Locale locale,
                       Model model,
                       HttpServletRequest req,
                       HttpSession session) throws Exception{

        model.addAttribute("locale", locale);
        String referer = req.getHeader("Referer");
        req.getSession().setAttribute("prevPage", referer);

        if(!cmsLoginService.checkPermission()){
            logger.debug("CheckPermission!!!!!!!!!!!");
            return "tiles.login/Login";
        }
        EgovUserDetails userDetails = (EgovUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        session.setAttribute("userBeans", userDetails.getEgovUserVO());

        logger.debug("cms!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        return "redirect:/cms/cmsUrlList";
    }
}
