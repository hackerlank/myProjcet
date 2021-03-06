package com.course.zx.controller;

import java.io.UnsupportedEncodingException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Exam;
import com.course.entity.ParentQuestion;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.framework.Page;


@Controller
@RequestMapping("examzx")
public class ExamListController {
	
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;
	
	/**
	 * 
	 * @desc				实现依照大题名称获取parentQuestion  返回内容方便specialprojectlist.jsp的内容动态获取
	 * @author				翟佳帆
	 * @param 				parentQuestionName 
	 * @createDate 			2016/12/1
	 * @param 				pageNum页码，parentQuestionName大题名称
	 * @return				String
	 * 
	 */
	@Resource
	private ParentQuestionServiceImpl parentQuestionSeriviceImpl;
	
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="parentQuestionName",defaultValue="") String parentQuestionName,
			@RequestParam(name="examType",defaultValue="") String examType,
			HttpServletRequest request,
			Model model){
		Page<ParentQuestion> page;
		
		try {
			examType = new String(examType.getBytes("ISO8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		page=this.parentQuestionSeriviceImpl.listParentQuestionByParentQuestionNameAndExamType(pageNum, 10, new Object[]{parentQuestionName,examType});	
		
		request.setAttribute("page", page);
		request.setAttribute("pqType",parentQuestionName);
		request.setAttribute("examType",examType);
		return "examzx/specialprojectlist";
	}
	
	/**
	 * 
	 * @desc				实现parentquestion的获取,返回zxpreview.jsp页面
	 * @author				李翘楚
	 * @createDate 			2016/12/1
	 * @param 				parentQuestionId  大题id  
	 * @return				String
	 * 
	 */
	@RequestMapping("preview")
	public String preview(@RequestParam(name="parentQuestionId", defaultValue="1") int parentQuestionId ,
				HttpServletRequest request,
				Model model){
		
		ParentQuestion parentQuestion = new ParentQuestion();
		parentQuestion = this.parentQuestionServiceImpl.getParentQuestion(parentQuestionId);
		String examType = parentQuestion.getExam().getExamType();
		request.setAttribute("parentQuestion", parentQuestion);
		request.setAttribute("examType", examType);
		return "examzx/zxpreview";
	}
	
	/**
	 * 
	 * @desc				实现parentquestion的获取,返回zxcontent.jsp页面
	 * @author				李翘楚
	 * @createDate 			2016/12/1
	 * @param 				parentQuestionId  大题id  
	 * @return				String
	 * 
	 */
	@RequestMapping("test")
	public String test(@RequestParam(name="parentQuestionId", defaultValue="1") int parentQuestionId ,
				HttpServletRequest request,
				HttpSession session,
				Model model){
		
		ParentQuestion parentQuestion = new ParentQuestion();
		if(parentQuestionId!=0){
			parentQuestion = this.parentQuestionServiceImpl.getParentQuestion(parentQuestionId);
			//假如没有登录返回预览页面
			if(session.getAttribute("stuId") == null){
				request.setAttribute("parentQuestion", parentQuestion);
				JOptionPane.showMessageDialog(null, "对不起，您还没有登录！现在返回登录页面...", "警告", JOptionPane.ERROR_MESSAGE);
				return "login_use";
			}
			Exam exam = parentQuestion.getExam();
			String examType = exam.getExamType();
			System.out.println("专项练习听力对应试卷名："+exam.getExamName());
			String examurl1[] = exam.getExamUrl().split("file/");
			String examurl2[] = examurl1[1].split("mp3");
			String url = "http://localhost:8080/myProject/ueditor/jsp/upload/file/"+examurl2[0]+"mp3";
			session.setAttribute("url", url);
			//不要返回exam 需要返回parentquestion
			request.setAttribute("parentQuestion", parentQuestion);
			request.setAttribute("examType", examType);
		}
		return "examzx/zxcontent";
	}
	
}
