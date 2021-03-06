package com.course.error.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.course.entity.Error;
import com.course.entity.Exam;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class ErrorDaoImpl extends BaseDao<Error, Integer> {
	/**
	 * 
	 * @Description 		存储错题
	 * @author 				孙晓辉
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	public void saveError(Error error){
		try {
			this.save(error);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @Description 		按页查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public Page<Error> findCollectError(int pageNum, int pageSize, int isCollect, int studentId, Object[] params) {
		
		String hql;
		if (params != null && params.length > 0) {
			if(isCollect == 1){
				hql = "from Error e where e.isCollect=1 and e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select ex from Exam ex where ex.examName like ?)";
			} else {
				hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select ex from Exam ex where ex.examName like ?)";
			}
			params[0] = "%" + params[0] + "%";
		}else{
			if(isCollect == 1){
				hql = "from Error e where e.isCollect=1 and e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+")";
			} else {
				hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+")";
			}
		}
		try {
			Page<Error> page = new Page<Error>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Description 		查询错题
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	
		public Page<Error> findCollectContent(int pageNum, int pageSize, int studentId, int examId, int parentQuestionId) {
			
			String hql;
			hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select e from Exam e where e.examId="+examId+") and e.parentQuestion in(select p from ParentQuestion p where p.parentQuestionId="+parentQuestionId+")";
			try {
				Page<Error> page = new Page<Error>();
				page.setCurrentPageNum(pageNum);
				page.setPageSize(pageSize);
				page = this.findByPage(pageNum, pageSize, hql, null);
				return page;
			} catch (Exception ee) {
				ee.printStackTrace();
				return null;
			}
		}
		
		
		public List<Error> findErrorList(int studentId, int examId, int parentQuestionId){
			String hql;
			hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select e from Exam e where e.examId="+examId+") and e.parentQuestion in(select p from ParentQuestion p where p.parentQuestionId="+parentQuestionId+")";
			List<Error> errors = new ArrayList<Error>(0);
			try {
				errors = super.findByProperty(hql, null);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return errors;
		}
		
	/**
	 * 
	 * @Description 		根据studentId,examId,parentQuestionId等字段查询某一错题记录
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	public Error getErr(int studentId, int examId, int parentQuestionId){
		String hql;
		hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select e from Exam e where e.examId="+examId+") and e.parentQuestion in(select p from ParentQuestion p where p.parentQuestionId="+parentQuestionId+")";
		Error error = new Error();
		try {
			error = super.findOne(hql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return error;
	}
	
	/**
	 * 
	 * @Description 		根据ID查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public Error getError(int errorId) {
		try {
			Error e = this.get(errorId);
			return e;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * 
	 * @Description 		删除某一错题
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	public void deleteError(int err){
		try {
			this.delete(err);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @Description 		编辑收藏标记字段isCollect为1
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	public void updateError(Error e){
		try {
			this.update(e);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
}
