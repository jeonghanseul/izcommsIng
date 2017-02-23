package egovframework.example.sample.web;

import egovframework.example.sample.service.LoginService;
import egovframework.example.sample.service.LoginVO;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController
{
  @Resource(name="loginService")
  private LoginService loginService;
  
  @RequestMapping({"/loginUsr.do"})
  public String loginUsr(@ModelAttribute("loginVO") LoginVO loginVO)
    throws Exception
  {
    return "sample/loginUsr";
  }
  
  @RequestMapping({"/actionLoginUsr.do"})
  public String actionLoginUsr(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)
    throws Exception
  {
    LoginVO resultVO1 = this.loginService.loginCheckId(loginVO);
    if ((resultVO1 != null) && (resultVO1.getId() != null) && (!resultVO1.getId().equals("")))
    {
      LoginVO resultVO = this.loginService.actionLogin(loginVO);
      if ((resultVO != null) && (resultVO.getId() != null) && (!resultVO.getId().equals("")))
      {
        request.getSession().setAttribute("loginVO", resultVO);
        request.getSession().setAttribute("name", resultVO.getName());
        return "redirect:/scdulList.do";
      }
      resultVO.setMessage("fail.PWD.inexact");
      model.addAttribute("message", resultVO.getMessage());
      return "redirect:/loginUsr.do";
    }
    resultVO1.setMessage("fail.ID.not.exist");
    model.addAttribute("message", resultVO1.getMessage());
    return "redirect:/loginUsr.do";
  }
  
  @RequestMapping({"/actionLogout.do"})
  public String actionLogout(HttpServletRequest request, ModelMap model)
    throws Exception
  {
    request.getSession().setAttribute("loginVO", null);
    
    return "redirect:/loginUsr.do";
  }
}
