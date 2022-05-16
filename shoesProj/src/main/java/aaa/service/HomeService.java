package aaa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface HomeService {
	Object execute(HttpServletRequest request, HttpSession session);
}
