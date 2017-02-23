package egovframework.example.sample.util;

import javax.servlet.http.HttpSession;

public class SessionUtil {
	
	public static Object getSessionValue(HttpSession session, String value){
	    return session.getAttribute(value);
	  }
	  
	  public static void setSessionValue(HttpSession session, String name, Object value){
	    session.setAttribute(name, value);
	  }
}
