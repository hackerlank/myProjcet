package com.course.zx.controller;

import java.io.UnsupportedEncodingException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			HttpServletRequest request,
			Model model){
		
		Page<ParentQuestion> page;
		
		if( parentQuestionName== null || "".equals(parentQuestionName)){
			page=this.parentQuestionSeriviceImpl.listParentQuestionByParentQuestionName(pageNum, 10, null);	
		}else{
			page=this.parentQuestionSeriviceImpl.listParentQuestionByParentQuestionName(pageNum, 10, new Object[]{parentQuestionName});
		}
		
		request.setAttribute("page", page);
		request.setAttribute("pqType",parentQuestionName);
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
		request.setAttribute("parentQuestion", parentQuestion);

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
				Model model){
		
		ParentQuestion parentQuestion = new ParentQuestion();
		parentQuestion = this.parentQuestionServiceImpl.getParentQuestion(parentQuestionId);
		request.setAttribute("parentQuestion", parentQuestion);

		return "examzx/zxcontent";
	}
	
	/**
	 * 
	 * @desc				跳转到判断页面
	 * @author				李翘楚
	 * @createDate 			2016/12/1
	 * @param 				parentQuestionId  大题id  
	 * @return				String
	 * 
	 */
	
}
