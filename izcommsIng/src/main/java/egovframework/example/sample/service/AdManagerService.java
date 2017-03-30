package egovframework.example.sample.service;

import java.util.List;

public interface AdManagerService
{
  public List<AdManagerVO> selectAdManagerList(AdManagerVO paramAdManagerVO) throws Exception;
  
  public int selectAdManagerListCount(AdManagerVO paramAdManagerVO) throws Exception;
  
  public AdManagerVO selectAdManagerView(AdManagerVO paramAdManagerVO) throws Exception;
  
  public void updateAdManagerAllot(AdManagerVO paramAdManagerVO) throws Exception;
  
  public void deleteAdManager(AdManagerVO paramAdManagerVO)throws Exception;
  
  public void insertAdManager(AdManagerVO paramAdManagerVO) throws Exception;
  
  public int selectCountAdCenter(int i, String fromDate, String toDate) throws Exception;
}
