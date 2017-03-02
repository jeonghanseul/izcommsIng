package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.AdManagerService;
import egovframework.example.sample.service.AdManagerVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adManagerService")
public class AdManagerServiceImpl
  extends EgovAbstractServiceImpl
  implements AdManagerService
{
  @Resource(name="adManagerDAO")
  private AdManagerDAO adManagerDAO;
  
  public List<AdManagerVO> selectAdManagerList(AdManagerVO adManagerVO)
    throws Exception
  {
    List<AdManagerVO> selectAdManagerList = this.adManagerDAO.selectAdManagerList(adManagerVO);
    return selectAdManagerList;
  }
  
  public int selectAdManagerListCount(AdManagerVO adManagerVO)
    throws Exception
  {
    return this.adManagerDAO.selectAdManagerListCount(adManagerVO);
  }
  
  public AdManagerVO selectAdManagerView(AdManagerVO adManagerVO)
    throws Exception
  {
    if (adManagerVO.getNo() == null) {
      throw new Exception("fail");
    }
    return this.adManagerDAO.selectAdManagerView(adManagerVO);
  }
  
  public void updateAdManagerAllot(AdManagerVO adManagerVO)
    throws Exception
  {
    this.adManagerDAO.updateAdManagerAllot(adManagerVO);
  }
  
  public void deleteAdManager(AdManagerVO adManagerVO)
    throws Exception
  {
    if (adManagerVO.getNo() == null) {
      throw new Exception("fail");
    }
    this.adManagerDAO.deleteAdManager(adManagerVO);
  }
  
  public void insertAdManager(AdManagerVO adManagerVO) throws Exception
  {
    this.adManagerDAO.insertAdManager(adManagerVO);
  }
  
  public int selectCountAdCenter(int i) throws Exception{
	  AdManagerVO adManagerVO = new AdManagerVO(); 
	  adManagerVO.setAdCenter("chartAd"+i);
	  System.out.println("=======================================================");
	  System.out.println("\t adManagerVO.getAdCenter : "+adManagerVO.getAdCenter());
	  System.out.println("=======================================================");
	  return this.selectAdManagerListCount(adManagerVO);
  }
}
