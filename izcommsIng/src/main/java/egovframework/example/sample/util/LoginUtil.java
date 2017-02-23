package egovframework.example.sample.util;

import egovframework.example.sample.service.LoginVO;
import javax.servlet.http.HttpSession;

public class LoginUtil
{
  public static LoginVO getLoginVO(HttpSession session)
    throws Exception
  {
    LoginVO loginVO = (LoginVO)SessionUtil.getSessionValue(session, "loginVO");
    return loginVO;
  }
}
