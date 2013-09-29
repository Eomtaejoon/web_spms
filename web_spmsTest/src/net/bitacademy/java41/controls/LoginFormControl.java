package net.bitacademy.java41.controls;

import java.util.Map;

import net.bitacademy.java41.annotations.Component;

/* Page Controller
 * - 로그인 폼 처리
 */
@Component("/auth/loginForm.do")
public class LoginFormControl implements PageControl {
	@Override
	public String execute(Map<String,Object> model) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String,String> cookies = (Map<String,String>)model.get("cookies");
		
		String email = "";
		boolean isSaveId = false;
		if (cookies.get("email") != null) {
			email = cookies.get("email");
			isSaveId = true;
		}
		
		model.put("email", email);
		model.put("isSaveId", isSaveId);
		//크
		return "/auth/LoginForm.jsp";
	}
}







