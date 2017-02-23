package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.ScdulService;
import egovframework.example.sample.service.ScdulVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("scdulService")
public class ScdulServiceImpl
  extends EgovAbstractServiceImpl
  implements ScdulService
{
  @Resource(name="scdulDAO")
  private ScdulDAO scdulDAO;
  
  public List<ScdulVO> selectScdulList(ScdulVO scdulVO)
    throws Exception
  {
    if (scdulVO.getStatus() == null) {
      scdulVO.setStatus("ALL");
    }
    Calendar calendar = Calendar.getInstance();
    if ((scdulVO.getMeetingDate() == null) || ("".equals(scdulVO.getMeetingDate())))
    {
      calendar.set(5, 1);
      scdulVO.setMeetingDate(String.format("%1$tF", new Object[] { calendar.getTime() }));
    }
    List<ScdulVO> selectScdulList = this.scdulDAO.selectScdulList(scdulVO);
    return selectScdulList;
  }
  
  public List<ScdulVO> selectSearchScdulList(ScdulVO scdulVO)
    throws Exception
  {
    List<ScdulVO> selectSearchScdulList = this.scdulDAO.selectSearchScdulList(scdulVO);
    return selectSearchScdulList;
  }
  
  public List<ScdulVO> selectDailyScdulList(ScdulVO scdulVO)
    throws Exception
  {
    List<ScdulVO> selectDailyScdulList = this.scdulDAO.selectDailyScdulList(scdulVO);
    return selectDailyScdulList;
  }
  
  public List<ScdulVO> selectSculToDoList(ScdulVO scdulVO)
    throws Exception
  {
    Calendar calendar = Calendar.getInstance();
    if ((scdulVO.getMeetingDate() == null) || ("".equals(scdulVO.getMeetingDate())))
    {
      calendar.set(5, 1);
      scdulVO.setMeetingDate(String.format("%1$tF", new Object[] { calendar.getTime() }));
    }
    List<ScdulVO> selectSculToDoList = this.scdulDAO.selectSculToDoList(scdulVO);
    return selectSculToDoList;
  }
  
  public List<ScdulVO> selectCountDayList(ScdulVO scdulVO)
    throws Exception
  {
    Calendar calendar = Calendar.getInstance();
    if ((scdulVO.getMeetingDate() == null) || ("".equals(scdulVO.getMeetingDate())))
    {
      calendar.set(5, 1);
      scdulVO.setMeetingDate(String.format("%1$tF", new Object[] { calendar.getTime() }));
    }
    List<ScdulVO> selectCountDayList = this.scdulDAO.selectCountDayList(scdulVO);
    return selectCountDayList;
  }
  
  public List<ScdulVO> selectScdulDayList(ScdulVO scdulVO)
    throws Exception
  {
    Calendar calendar = Calendar.getInstance();
    if ((scdulVO.getMeetingDate() == null) || ("".equals(scdulVO.getMeetingDate())))
    {
      calendar.set(5, 1);
      scdulVO.setMeetingDate(String.format("%1$tF", new Object[] { calendar.getTime() }));
    }
    List<ScdulVO> selectScdulDayList = this.scdulDAO.selectScdulDayList(scdulVO);
    return selectScdulDayList;
  }
  
  public void insertScdul(ScdulVO scdulVO)
    throws Exception
  {
    this.scdulDAO.insertScdul(scdulVO);
  }
  
  public void updateScdul(ScdulVO scdulVO)
    throws Exception
  {
    this.scdulDAO.updateScdul(scdulVO);
  }
  
  public ScdulVO selectScdulView(ScdulVO scdulVO)
    throws Exception
  {
    return this.scdulDAO.selectScdulView(scdulVO);
  }
  
  public int totalSelctSearchScdul(ScdulVO scdulVO)
    throws Exception
  {
    return this.scdulDAO.totalSelctSearchScdul(scdulVO);
  }
  
  public int totalSelctDailyScdulCount(ScdulVO scdulVO)
    throws Exception
  {
    return this.scdulDAO.totalSelctDailyScdulCount(scdulVO);
  }
}
