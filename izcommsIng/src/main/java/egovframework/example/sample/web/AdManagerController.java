package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.sample.service.AdManagerService;
import egovframework.example.sample.service.AdManagerVO;
import egovframework.example.sample.service.MemberVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdManagerController
{
  @Resource(name="propertiesService")
  protected EgovPropertyService propertiesService;
  @Resource(name="adManagerService")
  private AdManagerService adManagerService;
  
  @RequestMapping({"/adManagerList.do"})
  public String adManagerList(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, HttpServletRequest request, ModelMap model)
    throws Exception
  {
    adManagerVO.setPageUnit(this.propertiesService.getInt("pageUnit"));
    adManagerVO.setPageSize(this.propertiesService.getInt("pageSize"));
    
    PaginationInfo paginationInfo = new PaginationInfo();
    paginationInfo.setCurrentPageNo(adManagerVO.getPageIndex());
    paginationInfo.setRecordCountPerPage(adManagerVO.getPageUnit());
    paginationInfo.setPageSize(adManagerVO.getPageSize());
    
    adManagerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
    adManagerVO.setLastIndex(paginationInfo.getLastRecordIndex());
    adManagerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
    List<AdManagerVO> selectAdManagerList = this.adManagerService.selectAdManagerList(adManagerVO);
    model.addAttribute("selectAdManagerList", selectAdManagerList);
    
    int total = this.adManagerService.selectAdManagerListCount(adManagerVO);
    
    paginationInfo.setTotalRecordCount(total);
    model.addAttribute("paginationInfo", paginationInfo);
    return "sample/adManagerList";
  }
  
  @RequestMapping(value={"/adManagerView.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String adManagerView(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, ModelMap model)
    throws Exception
  {
    adManagerVO = this.adManagerService.selectAdManagerView(adManagerVO);
    
    model.addAttribute("adManagerVO", adManagerVO);
    
    return "sample/adManagerView";
  }
  
  @RequestMapping(value={"/deleteAdManager.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String deleteAdManager(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, ModelMap model)
    throws Exception
  {
    try
    {
      this.adManagerService.deleteAdManager(adManagerVO);
    }
    catch (Exception e)
    {
      model.addAttribute("msg", "잘못된 접근 입니다.");
      model.addAttribute("url", "./adManagerList.do");
      
      return "common/error";
    }
    return "redirect:/adManagerList.do";
  }
  
  @RequestMapping(value={"/insertAdManager.do"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String insertAdManager(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, HttpServletRequest request, ModelMap model)
    throws Exception
  {
    return "admin/adManagerAdd";
  }
  
  @RequestMapping(value={"/insertAdManagerDo.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String insertAdManagerDo(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, ModelMap model)
    throws Exception
  {
    this.adManagerService.insertAdManager(adManagerVO);
    return "redirect:/adManagerList.do";
  }
  
  @RequestMapping("/adManagerChartView.do")
	public String adManagerChartView(@ModelAttribute("adManagerVO") AdManagerVO adManagerVO, HttpServletRequest request, ModelMap model)throws Exception{
		
	  return "sample/adManagerChartView";
	}
	
  
  /**
   * 차트 그리기 위한 ajax json 데이터
 * @param adManagerVO
 * @return
 * @throws Exception
 */
@RequestMapping("/adChartCount.do")
  public ModelAndView adChartCount()
    throws Exception
  {
    ModelAndView mav = new ModelAndView("jsonView");
    
    for(int i=0; i<=4; i++){
    	
    	int value = adManagerService.selectCountAdCenter(i);
    	mav.addObject("Ad"+i, value);
    	System.out.println("-------------------------------------------------------");
    	System.out.println("\t mav : "+mav);
    	System.out.println("-------------------------------------------------------");
    }
    return mav;
  }
}
