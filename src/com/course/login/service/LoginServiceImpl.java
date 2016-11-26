package com.course.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.StudentInfo;
import com.course.login.dao.LoginDaoImpl;

@Service
public class LoginServiceImpl {
	
	@Resource
	private LoginDaoImpl loginDaoImpl;
	
	/**
	 * 
	 * @Description 		注册
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void regist(String name,String pwd){
		StudentInfo student = new StudentInfo();
		student.setLoginName(name);
		student.setPassword(pwd);
		student.setRoleName("student");
		try {
			this.loginDaoImpl.save(student);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @Description 		根据姓名查询账户已存在
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo checkStudent(String name){
		return this.loginDaoImpl.findByName(name);
	}
	
	/**
	 * 
	 * @Description 		登录
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo login(String name, String pwd){
		return this.loginDaoImpl.findByNameAndPwd(name, pwd);
	}
	
	/**
	 * 
	 * @Description 		根据学生ID查找学生
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo getStudentInfo(int studentId){
		return this.loginDaoImpl.getStudentInfo(studentId);
	}
	
	/**
	 * 
	 * @Description 		添加学生的属性
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void editStudentInfo(StudentInfo s){
		StudentInfo stu = this.loginDaoImpl.getStudentInfo(s.getStudentId());
		System.out.println("editStudentInfo:password"+stu.getPassword());
		stu.setHobby(s.getHobby());
		stu.setLocation(s.getLocation());
		stu.setIntroduce(s.getIntroduce());
		try {
			this.loginDaoImpl.updateStudentInfo(stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
