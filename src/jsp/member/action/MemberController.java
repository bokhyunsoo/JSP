package jsp.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원관련 Controller
 *
 */
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
     * GET 방식일 경우 doGet()
     */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	/**
     * POST 방식일 경우 doPost()
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	 /**
     * 명령어에 따른 해당 Action을 지정해 준다.
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 넘어온 커맨드를 추출하는 과정
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		
		String command = requestURI.substring(cmdIdx);
		
		ActionForward forward = null;
		Action action = null;
		
		// 보여줄 화면 URL
		String form = "MainForm.jsp?contentPage=member/";
		
		try {
			if(command.equals("MainForm.do")) // 메인화면 이동
			{
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath("MainForm.jsp");
			}
			else if(command.equals("LoginForm.do"))    // 로그인화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"LoginForm.jsp");
            }
            else if(command.equals("JoinForm.do"))    // 회원가입화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"JoinForm.jsp");
            }
            else if(command.equals("UserInfoForm.do"))    // 내정보 클릭 - 회원정보화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"UserInfoForm.jsp");
            }
            else if(command.equals("ModifyForm.do")) // 회원수정화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"ModifyForm.jsp");
            }
            else if(command.equals("DeleteForm.do")) // 회원삭제화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"DeleteForm.jsp");
            }
            else if(command.equals("Result.do")) // 각종 처리결과 화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"ResultForm.jsp");
            }
            // 각종 처리 액션
            else if(command.equals("MemberLoginAction.do")) // 로그인 처리
            {
                action = new MemberLoginAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberLogoutAction.do")) // 로그아웃 처리
            {
                action = new MemberLogoutAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberJoinAction.do")) // 회원가입 처리
            {
                action = new MemberJoinAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberInfoAction.do")) // 회원정보화면에 보여줄 정보 처리
            {
                action = new MemberInfoAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberModifyFormAction.do")) // 회원수정화면에 보여줄 정보 처리
            {
                action = new MemberModifyFormAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberModifyAction.do")) // 회원수정 처리
            {
                action = new MemberModifyAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberDeleteAction.do")) // 회원삭제 처리
            {
                action = new MemberDeleteAction();
                forward = action.execute(request, response);
            }
 
            // 화면이동 - isRedirext() 값에 따라 sendRedirect 또는 forward를 사용
            // sendRedirect : 새로운 페이지에서는 request와 response객체가 새롭게 생성된다.
            // forward : 현재 실행중인 페이지와 forwad에 의해 호출될 페이지는 request와 response 객체를 공유
            if(forward != null){
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getNextPath());
                } else {
                    RequestDispatcher dispatcher = request
                            .getRequestDispatcher(forward.getNextPath());
                    dispatcher.forward(request, response);
                }
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    } // end doProcess
}