package egovframework.example.sample.service;

public class MemberVO
  extends MemberDefaultVO
{
  private static final long serialVersionUID = 5836196838072467221L;
  private String id;
  private String pwd;
  private String name;
  private String telNo;
  private String email;
  private String grade;
  private String memberGroup;
  private String joinDate;
  private String refireDate;
  private String address;
  private String detailAddress;
  
  public String getId()
  {
    return this.id;
  }
  
  public void setId(String id)
  {
    this.id = id;
  }
  
  public String getPwd()
  {
    return this.pwd;
  }
  
  public void setPwd(String pwd)
  {
    this.pwd = pwd;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public String getTelNo()
  {
    return this.telNo;
  }
  
  public void setTelNo(String telNo)
  {
    this.telNo = telNo;
  }
  
  public String getEmail()
  {
    return this.email;
  }
  
  public void setEmail(String email)
  {
    this.email = email;
  }
  
  public String getGrade()
  {
    return this.grade;
  }
  
  public void setGrade(String grade)
  {
    this.grade = grade;
  }
  
  public String getMemberGroup()
  {
    return this.memberGroup;
  }
  
  public void setMemberGroup(String memberGroup)
  {
    this.memberGroup = memberGroup;
  }
  
  public String getJoinDate()
  {
    return this.joinDate;
  }
  
  public void setJoinDate(String joinDate)
  {
    this.joinDate = joinDate;
  }
  
  public String getRefireDate()
  {
    return this.refireDate;
  }
  
  public void setRefireDate(String refireDate)
  {
    this.refireDate = refireDate;
  }
  
  public String getAddress()
  {
    return this.address;
  }
  
  public void setAddress(String address)
  {
    this.address = address;
  }
  
  public String getDetailAddress()
  {
    return this.detailAddress;
  }
  
  public void setDetailAddress(String detailAddress)
  {
    this.detailAddress = detailAddress;
  }
}
