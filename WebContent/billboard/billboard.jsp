<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" name="viewport" content="text/html； charset=utf-8；width=device-width" />
<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/about_us.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js" /></script>
<script src="${ctx }/js/index.js"></script>
<script src="${ctx }/js/about_us.js"></script>
<script src="${ctx }/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/js/header.js"></script>
<title>考试流程</title>
<script type="text/javascript">
	var str = '${logined}';
	window.onload = function changStyle(){
		if("on" == str){
			var log = document.getElementById("login");
			log.style.display="none";
			var v = document.getElementById("after_login");
			v.style.display="block";
		}
	}
			
</script>
<style>
	img {
　　width:600px;
	height:400px;
	margin:0 0 20px;
　　}
</style>
</head>
<body>
	<!-- header-->
	<div>
		<div class="header">
			<div class="logo">
				<a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png" /></a>
			</div>
			<div class="search">
				<input id="searchParam" type="text" name="searchParam" placeholder="请输入信息搜索公告" class="text"/>
    			<a href="javascrpt:search()" onclick="searchp();return false;"><input type="submit" name="" class="button" value="搜索"/></a>
			</div>
			<div class="login" id="login">
				<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;| <a
					href="${ctx }/register.jsp"><button>注册</button></a>
			</div>

			<div class="after_login" id="after_login">
				<div id="username">
					<p>${student.loginName }</p>
				</div>
				<div class="nav" id="nav">
					<ul>
						<li onmousemove="showsub(this)" onmouseout="hidesub(this)">
							<a href="#">
								<c:if test="${empty student.url}">
                              		<img src="${ctx }/images/photo.jpg"/>
								</c:if>
								<c:if test="${!empty student.url}">
                              		${student.url}
								</c:if>
							</a>
							<ul>
								<li><a href="${ctx }/info/usermessage.jsp">个人信息</a></li>
								<li><a href="${ctx }/info/install.jsp">设置</a></li>
								<li><a href="${ctx }/loginuser/turnOut">退出登录</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="menu">
			<ul>
				<li class="current"><a href="${ctx }/">网站首页</a></li>
				<li><a href="${ctx }/category?type=四级">大学英语四级</a></li>
				<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
				<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
			</ul>
		</div>
	</div>
	<div id="content">	
	<!--面包屑-->
	<div class="breadcrumb">
		<a href="${ctx }/">首页</a>>><a href="${ctx }/notice/billboardlist">公告板</a>
	</div>
	<!--左侧边栏-->
	<div class="left">
		<h2>公告板</h2>
		<div class="vtitle">
			<a href="${ctx }/notice/billboardlist?noticeType=考试流程">考试流程</a>
		</div>
		<div class="vcon" style="display: none;"></div>
		<div class="vtitle">
			<a href="${ctx }/notice/billboardlist?noticeType=报名流程">报名流程</a>
		</div>
		<div class="vcon" style="display: none;"></div>
		<div class="vtitle">
			<a href="${ctx }/notice/billboardlist?noticeType=成绩查询">成绩查询</a>
		</div>
		<div class="vcon" style="display: none;"></div>
		<div class="vtitle">
			<a href="${ctx }/notice/billboardlist?noticeType=考试技巧">考试技巧</a>
		</div>
		<div class="vcon" style="display: none;"></div>
		<div class="leftfoot"></div>
	</div>
	<!--右侧内容-->
	<div class="right">
		<div class="right_bread">
			<h1>
				${notice.noticeType}
			</h1>
		</div>
		<div class="right_content" style="line-height: 30px;">
			<div class="title_h1">
				<font style="font-size: 20px; font-weight: bold;">${notice.noticeTitle }</font>
			</div>
			<div class="wenzhang_content">

				<p
					style="text-align: left; line-height: 1.5em; text-indent: 2em; margin: 0px 0px 10px">

						${notice.noticeContent}

				</p>


				<p style="line-height: 1.5em"></p>

			</div>
		</div>
	</div>
	</div>
	<!--footer-->
	<div id="footer">
		<p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
        <p>版权所有：猿计划项目小组</p>
	</div>
	<script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/notice/billboardlist?searchParam="+p;
		}
	</script>
</body>
</html>