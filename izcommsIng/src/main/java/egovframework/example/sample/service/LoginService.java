package egovframework.example.sample.service;

public interface LoginService {
	
	LoginVO actionLogin(LoginVO vo) throws Exception;
	
	LoginVO loginCheckId(LoginVO vo) throws Exception;
}
