package egovframework.example.sample.service;

import java.util.List;

public abstract interface MemberService
{
  public abstract List<MemberVO> selectMemberList(MemberVO paramMemberVO)
    throws Exception;
  
  public abstract int checkId(MemberVO paramMemberVO)
    throws Exception;
  
  public abstract int selectMemberListCount(MemberVO paramMemberVO)
    throws Exception;
  
  public abstract void insertMember(MemberVO paramMemberVO)
    throws Exception;
  
  public abstract MemberVO selectMemberById(MemberVO paramMemberVO)
    throws Exception;
  
  public abstract void updateMember(MemberVO paramMemberVO)
    throws Exception;
}
