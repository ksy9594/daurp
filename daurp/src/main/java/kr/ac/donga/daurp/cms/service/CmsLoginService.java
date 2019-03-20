package kr.ac.donga.daurp.cms.service;

import ngel.core.service.AbstractCommonService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CmsLoginService extends AbstractCommonService {

    public boolean checkPermission() throws Exception {
      if("anonymousUser".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())
          || null == SecurityContextHolder.getContext().getAuthentication().getPrincipal()
          || "".equals(SecurityContextHolder.getContext().getAuthentication().getPrincipal())){
          logger.debug("INFO           :           " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());
          return false;
      } else {
          return true;
      }
    }
}
