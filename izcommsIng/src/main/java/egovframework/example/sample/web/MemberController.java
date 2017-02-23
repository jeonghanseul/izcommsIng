package egovframework.example.sample.web;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class MemberController
{
  @Resource(name="propertiesService")
  protected EgovPropertyService propertiesService;
  @Resource(name="memberService")
  private MemberService memberService;
  @Autowired
  private DefaultBeanValidator beanValidator;
  
  @RequestMapping({"/admin/selectMemberList.do"})
  public String selectMemberList(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, ModelMap model)
    throws Exception
  {
    memberVO.setPageUnit(this.propertiesService.getInt("pageUnit"));
    memberVO.setPageSize(this.propertiesService.getInt("pageSize"));
    
    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(memberVO.getPageIndex());
    paginationInfo.setRecordCountPerPage(memberVO.getPageUnit());
    paginationInfo.setPageSize(memberVO.getPageSize());
    
    memberVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    memberVO.setLastIndex(paginationInfo.getLastRecordIndex());
    memberVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
    List<MemberVO> selectMemberList = this.memberService.selectMemberList(memberVO);
    model.addAttribute("selectMemberList", selectMemberList);
    
    int total = this.memberService.selectMemberListCount(memberVO);
    
    paginationInfo.setTotalRecordCount(total);
    model.addAttribute("paginationInfo", paginationInfo);
    return "admin/memberList";
  }
  
  @RequestMapping(value={"/admin/addMember.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addScdul(@ModelAttribute("memberVO") MemberVO memberVO, ModelMap model)
    throws Exception
  {
    return "admin/addMember";
  }
  
  @RequestMapping(value={"/admin/addMemberDo.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String addMemberDo(@ModelAttribute("memberVO") MemberVO memberVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    this.beanValidator.validate(memberVO, bindingResult);
    if (bindingResult.hasErrors()) {
      return "redirect:/admin/addMember.do";
    }
    this.memberService.insertMember(memberVO);
    return "redirect:/admin/selectMemberList.do";
  }
  
  @RequestMapping({"/admin/checkId.do"})
  public ModelAndView checkId(@ModelAttribute("memberVO") MemberVO memberVO)
    throws Exception
  {
    MemberVO resultVO = new MemberVO();
    
    ModelAndView mav = new ModelAndView("jsonView");
    
    int checkId = this.memberService.checkId(memberVO);
    if (checkId > 0) {
      resultVO.setId("");
    } else {
      resultVO.setId(memberVO.getId());
    }
    mav.addObject("id", resultVO.getId());
    
    return mav;
  }
  
  @RequestMapping(value={"/admin/modifyMember.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String modifyMember(@ModelAttribute("memberVO") MemberVO memberVO, ModelMap model)
    throws Exception
  {
    memberVO = this.memberService.selectMemberById(memberVO);
    
    model.addAttribute("memberVO", memberVO);
    
    return "admin/modifyMember";
  }
  
  @RequestMapping(value={"/admin/modifyMemberDo.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String modifyMemberDo(@ModelAttribute("memberVO") MemberVO memberVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    this.beanValidator.validate(memberVO, bindingResult);
    if (bindingResult.hasErrors()) {
      return "redirect:/admin/modifyMember.do";
    }
    this.memberService.updateMember(memberVO);
    
    return "redirect:/admin/selectMemberList.do";
  }
  
  @RequestMapping(value={"/admin/viewMember.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String viewMember(@ModelAttribute("memberVO") MemberVO memberVO, ModelMap model)
    throws Exception
  {
    memberVO = this.memberService.selectMemberById(memberVO);
    
    model.addAttribute("memberVO", memberVO);
    
    return "admin/viewMember";
  }
}
