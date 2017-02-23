package egovframework.example.sample.service;

import java.util.List;

public abstract interface ScdulService
{
  public abstract List<ScdulVO> selectScdulList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract List<ScdulVO> selectSculToDoList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract List<ScdulVO> selectCountDayList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract List<ScdulVO> selectScdulDayList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract void insertScdul(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract void updateScdul(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract ScdulVO selectScdulView(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract List<ScdulVO> selectSearchScdulList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract List<ScdulVO> selectDailyScdulList(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract int totalSelctSearchScdul(ScdulVO paramScdulVO)
    throws Exception;
  
  public abstract int totalSelctDailyScdulCount(ScdulVO paramScdulVO)
    throws Exception;
}
