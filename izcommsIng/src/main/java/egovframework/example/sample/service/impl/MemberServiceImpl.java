package egovframework.example.sample.service.impl;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl
  extends EgovAbstractServiceImpl
  implements MemberService
{
  @Resource(name="memberDAO")
  private MemberDAO memberDAO;
  
  public List<MemberVO> selectMemberList(MemberVO memberVO)
    throws Exception
  {
    List<MemberVO> selectMemberList = this.memberDAO.selectMemberList(memberVO);
    return selectMemberList;
  }
  
  public int selectMemberListCount(MemberVO memberVO)
    throws Exception
  {
    return this.memberDAO.selectMemberListCount(memberVO);
  }
  
  public int checkId(MemberVO memberVO)
    throws Exception
  {
    return this.memberDAO.checkId(memberVO);
  }
  
  public void insertMember(MemberVO memberVO)
    throws Exception
  {
    this.memberDAO.insertMember(memberVO);
  }
  
  public MemberVO selectMemberById(MemberVO memberVO)
    throws Exception
  {
    return this.memberDAO.selectMemberById(memberVO);
  }
  
  public void updateMember(MemberVO memberVO)
    throws Exception
  {
    this.memberDAO.updateMember(memberVO);
  }
}
