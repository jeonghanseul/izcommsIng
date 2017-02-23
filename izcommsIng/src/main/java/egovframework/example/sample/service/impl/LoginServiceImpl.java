package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.LoginService;
import egovframework.example.sample.service.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl
  extends EgovAbstractServiceImpl
  implements LoginService
{
  @Resource(name="loginDAO")
  private LoginDAO loginDAO;
  
  public LoginVO actionLogin(LoginVO vo)
    throws Exception
  {
    LoginVO loginVO = this.loginDAO.actionLogin(vo);
    if ((loginVO != null) && (!loginVO.getId().equals("")) && (!loginVO.getPwd().equals(""))) {
      return loginVO;
    }
    loginVO = new LoginVO();
    
    return loginVO;
  }
  
  public LoginVO loginCheckId(LoginVO vo)
    throws Exception
  {
    LoginVO loginVO = this.loginDAO.loginCheckId(vo);
    if ((loginVO != null) && (!loginVO.getId().equals("")) && (!loginVO.getPwd().equals(""))) {
      return loginVO;
    }
    loginVO = new LoginVO();
    
    return loginVO;
  }
}
