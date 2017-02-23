package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.ScdulVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository("scdulDAO")
public class ScdulDAO
  extends EgovAbstractDAO
{
  public List<ScdulVO> selectScdulList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectSculList", scdulVO);
  }
  
  public List<ScdulVO> selectSearchScdulList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectSearchScdulList", scdulVO);
  }
  
  public List<ScdulVO> selectDailyScdulList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectDailyScdulList", scdulVO);
  }
  
  public List<ScdulVO> selectSculToDoList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectSculToDoList", scdulVO);
  }
  
  public List<ScdulVO> selectCountDayList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectCountDayList", scdulVO);
  }
  
  public List<ScdulVO> selectScdulDayList(ScdulVO scdulVO)
    throws Exception
  {
    return (List<ScdulVO>) list("scdulDAO.selectScdulDayList", scdulVO);
  }
  
  public String insertScdul(ScdulVO scdulVO)
    throws Exception
  {
    return (String)insert("scdulDAO.insertScdul", scdulVO);
  }
  
  public int updateScdul(ScdulVO scdulVO)
    throws Exception
  {
    return update("scdulDAO.updateScdul", scdulVO);
  }
  
  public ScdulVO selectScdulView(ScdulVO scdulVO)
    throws Exception
  {
    return (ScdulVO)select("scdulDAO.selectScdulView", scdulVO);
  }
  
  public int totalSelctSearchScdul(ScdulVO scdulVO)
    throws Exception
  {
    return ((Integer)select("scdulDAO.totalSelctSearchScdul", scdulVO)).intValue();
  }
  
  public int totalSelctDailyScdulCount(ScdulVO scdulVO)
    throws Exception
  {
    return ((Integer)select("scdulDAO.totalSelctDailyScdulCount", scdulVO)).intValue();
  }
}
