package egovframework.example.sample.web;

import egovframework.example.sample.service.AdManagerService;
import egovframework.example.sample.service.AdManagerVO;
import egovframework.example.sample.service.ScdulService;
import egovframework.example.sample.service.ScdulVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import java.io.PrintStream;
import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class ScdulController
{
  @Resource(name="scdulService")
  private ScdulService scdulService;
  @Autowired
  private DefaultBeanValidator beanValidator;
  @Resource(name="propertiesService")
  protected EgovPropertyService propertiesService;
  @Resource(name="adManagerService")
  private AdManagerService adManagerService;
  
  @RequestMapping({"/scdulList.do"})
  public String scdulList(@ModelAttribute("scdulVO") ScdulVO scdulVO, HttpSession session, HttpServletRequest request, ModelMap model)
    throws Exception
  {
    Calendar calendar = Calendar.getInstance();
    if ((scdulVO.getCurYear() != null) && (scdulVO.getCurMonth() != null))
    {
      int intYear = Integer.parseInt(scdulVO.getCurYear());
      int intMonth = Integer.parseInt(scdulVO.getCurMonth());
      int intDay = 1;
      
      calendar.set(intYear, intMonth - 1, intDay);
    }
    else
    {
      String strType = request.getParameter("type");
      if ((strType != null) && (!strType.equals("")))
      {
        int intYear = Integer.parseInt(request.getParameter("curYear"));
        int intMonth = Integer.parseInt(request.getParameter("curMonth"));
        int intDay = Integer.parseInt(request.getParameter("curDay"));
        if (intMonth > 12)
        {
          intYear++;
          intMonth = 1;
        }
        if (intMonth < 1)
        {
          intYear--;
          intMonth = 12;
        }
        calendar.set(intYear, intMonth - 1, intDay);
      }
    }
    System.out.println("today : " + calendar.getTime());
    System.out.println("curYear : " + calendar.get(1));
    System.out.println("curMonth : " + (calendar.get(2) + 1));
    System.out.println("curDay : " + calendar.get(5));
    
    model.addAttribute("curYear", Integer.valueOf(calendar.get(1)));
    model.addAttribute("curMonth", Integer.valueOf(calendar.get(2) + 1));
    model.addAttribute("curDay", Integer.valueOf(calendar.get(5)));
    
    calendar.set(5, 1);
    model.addAttribute("firstDayOfMonth", calendar.getTime());
    System.out.println("firstDayOfMonth:" + String.format("%1$tF %1$tT", new Object[] { calendar.getTime() }));
    
    model.addAttribute("firstDayOfWeek", Integer.valueOf(calendar.get(7)));
    
    model.addAttribute("lastDayOfMonth", Integer.valueOf(calendar.getActualMaximum(5)));
    
    calendar.set(5, calendar.getActualMaximum(5));
    model.addAttribute("lastDayOfLastWeek", Integer.valueOf(calendar.get(7)));
    
    calendar.set(2, calendar.get(2) + 1);
    calendar.set(5, 1);
    model.addAttribute("firstDayOfNextMonth", calendar.getTime());
    System.out.println("firstDayOfNextMonth:" + String.format("%1$tF %1$tT", new Object[] { calendar.getTime() }));
    
    List<ScdulVO> scdulList = this.scdulService.selectScdulList(scdulVO);
    model.addAttribute("scdulList", scdulList);
    
    List<ScdulVO> selectScdulDayList = this.scdulService.selectScdulDayList(scdulVO);
    model.addAttribute("selectScdulDayList", selectScdulDayList);
    
    List<ScdulVO> selectSculToDoList = this.scdulService.selectSculToDoList(scdulVO);
    model.addAttribute("selectSculToDoList", selectSculToDoList);
    
    List<ScdulVO> selectCountDayList = this.scdulService.selectCountDayList(scdulVO);
    model.addAttribute("selectCountDayList", selectCountDayList);
    
    return "sample/scdulList";
  }
  
  @RequestMapping(value={"/addScdul.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addScdul(@ModelAttribute("scdulVO") ScdulVO scdulVO, ModelMap model)
    throws Exception
  {
    return "sample/addScdul";
  }
  
  @RequestMapping({"/jusoPopup.do"})
  public String jusoPopup()
    throws Exception
  {
    return "sample/popup/jusoPopup";
  }
  
  @RequestMapping(value={"/addScdulPost.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String addScdulPost(@ModelAttribute("scdulVO") ScdulVO scdulVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    this.beanValidator.validate(scdulVO, bindingResult);
    if (bindingResult.hasErrors()) {
      return "redirect:/addScdul.do";
    }
    this.scdulService.insertScdul(scdulVO);
    
    return "redirect:/scdulList.do";
  }
  
  @RequestMapping(value={"/selectScdulView.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String selectScdulView(@ModelAttribute("scdulVO") ScdulVO scdulVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    scdulVO = this.scdulService.selectScdulView(scdulVO);
    model.addAttribute("scdulVO", scdulVO);
    
    return "sample/viewScdul";
  }
  
  @RequestMapping(value={"/updateScdul.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateScdul(@ModelAttribute("scdulVO") ScdulVO scdulVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    scdulVO = this.scdulService.selectScdulView(scdulVO);
    model.addAttribute("scdulVO", scdulVO);
    
    return "sample/updateScdul";
  }
  
  @RequestMapping(value={"/updateScdulDo.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updateScdulDo(@ModelAttribute("scdulVO") ScdulVO scdulVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    this.beanValidator.validate(scdulVO, bindingResult);
    if (bindingResult.hasErrors()) {
      return "redirect:/updateScdul.do";
    }
    this.scdulService.updateScdul(scdulVO);
    
    return "redirect:/selectScdulView.do?No=" + scdulVO.getNo();
  }
  
  @RequestMapping({"/selectScdulList.do"})
  public String selectScdulList(@ModelAttribute("scdulVO") ScdulVO scdulVO, ModelMap model)
    throws Exception
  {
    scdulVO.setPageUnit(this.propertiesService.getInt("pageUnit"));
    scdulVO.setPageSize(this.propertiesService.getInt("pageSize"));
    
    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(scdulVO.getPageIndex());
    paginationInfo.setRecordCountPerPage(scdulVO.getPageUnit());
    paginationInfo.setPageSize(scdulVO.getPageSize());
    
    scdulVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    scdulVO.setLastIndex(paginationInfo.getLastRecordIndex());
    scdulVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
    List<ScdulVO> selectScdulList = this.scdulService.selectSearchScdulList(scdulVO);
    model.addAttribute("selectScdulList", selectScdulList);
    
    int total = this.scdulService.totalSelctSearchScdul(scdulVO);
    
    paginationInfo.setTotalRecordCount(total);
    model.addAttribute("paginationInfo", paginationInfo);
    return "sample/selctScdulList";
  }
  
  @RequestMapping({"/selectDailyScdulList.do"})
  public String selectDailyScdulList(@ModelAttribute("scdulVO") ScdulVO scdulVO, ModelMap model)
    throws Exception
  {
    scdulVO.setPageUnit(this.propertiesService.getInt("pageUnit"));
    scdulVO.setPageSize(this.propertiesService.getInt("pageSize"));
    
    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(scdulVO.getPageIndex());
    paginationInfo.setRecordCountPerPage(scdulVO.getPageUnit());
    paginationInfo.setPageSize(scdulVO.getPageSize());
    
    scdulVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    scdulVO.setLastIndex(paginationInfo.getLastRecordIndex());
    scdulVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
    List<ScdulVO> selectDailyScdulList = this.scdulService.selectDailyScdulList(scdulVO);
    model.addAttribute("selectDailyScdulList", selectDailyScdulList);
    
    int total = this.scdulService.totalSelctDailyScdulCount(scdulVO);
    
    paginationInfo.setTotalRecordCount(total);
    model.addAttribute("paginationInfo", paginationInfo);
    return "sample/dailyScdulList";
  }
  
  @RequestMapping(value={"/addAllot.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addAllot(@ModelAttribute("scdulVO") ScdulVO scdulVO, ModelMap model, @RequestParam String allotKey)
    throws Exception
  {
    AdManagerVO adManagerVO = new AdManagerVO();
    adManagerVO.setNo(allotKey);
    
    adManagerVO = this.adManagerService.selectAdManagerView(adManagerVO);
    
    scdulVO.setAllotKey(allotKey);
    scdulVO.setCompany(adManagerVO.getBizName());
    scdulVO.setAdManager(adManagerVO.getBizUser());
    scdulVO.setTelNo(adManagerVO.getBizTelNo());
    scdulVO.setEmail(adManagerVO.getBizEmail());
    scdulVO.setType(adManagerVO.getBizType());
    scdulVO.setEtc(adManagerVO.getBizAsk());
    
    return "sample/addAllot";
  }
  
  @RequestMapping(value={"/addAllotDo.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String addAllotDo(@ModelAttribute("scdulVO") ScdulVO scdulVO, BindingResult bindingResult, ModelMap model)
    throws Exception
  {
    this.beanValidator.validate(scdulVO, bindingResult);
    if (bindingResult.hasErrors()) {
      return "redirect:/addAllot.do?allotKey=" + scdulVO.getAllotKey();
    }
    this.scdulService.insertScdul(scdulVO);
    AdManagerVO adManagerVO = new AdManagerVO();
    adManagerVO.setNo(scdulVO.getAllotKey());
    
    this.adManagerService.updateAdManagerAllot(adManagerVO);
    
    return "redirect:/adManagerList.do";
  }
}
