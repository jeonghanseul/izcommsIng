package egovframework.example.sample.service;

import java.util.List;

public abstract interface AdManagerService
{
  public abstract List<AdManagerVO> selectAdManagerList(AdManagerVO paramAdManagerVO)
    throws Exception;
  
  public abstract int selectAdManagerListCount(AdManagerVO paramAdManagerVO)
    throws Exception;
  
  public abstract AdManagerVO selectAdManagerView(AdManagerVO paramAdManagerVO)
    throws Exception;
  
  public abstract void updateAdManagerAllot(AdManagerVO paramAdManagerVO)
    throws Exception;
  
  public abstract void deleteAdManager(AdManagerVO paramAdManagerVO)
    throws Exception;
  
  public abstract void insertAdManager(AdManagerVO paramAdManagerVO)
    throws Exception;
}
