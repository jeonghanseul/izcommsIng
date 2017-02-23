package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.AdManagerVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository("adManagerDAO")
public class AdManagerDAO
  extends EgovAbstractDAO
{
  public List<AdManagerVO> selectAdManagerList(AdManagerVO adManagerVO)
    throws Exception
  {
    return (List<AdManagerVO>) list("adManagerDAO.selectAdManagerList", adManagerVO);
  }
  
  public int selectAdManagerListCount(AdManagerVO adManagerVO)
    throws Exception
  {
    return ((Integer)select("adManagerDAO.selectAdManagerListCount", adManagerVO)).intValue();
  }
  
  public AdManagerVO selectAdManagerView(AdManagerVO adManagerVO)
    throws Exception
  {
    return (AdManagerVO)select("adManagerDAO.selectAdManagerView", adManagerVO);
  }
  
  public int updateAdManagerAllot(AdManagerVO adManagerVO)
    throws Exception
  {
    return update("adManagerDAO.updateAdManagerAllot", adManagerVO);
  }
  
  public void deleteAdManager(AdManagerVO adManagerVO)
    throws Exception
  {
    delete("adManagerDAO.deleteAdManager", adManagerVO);
  }
  
  public String insertAdManager(AdManagerVO adManagerVO)
    throws Exception
  {
    return (String)insert("adManagerDAO.insertAdManager", adManagerVO);
  }
}
