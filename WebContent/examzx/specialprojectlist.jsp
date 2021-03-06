<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/css/special.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
<script src="${ctx }/js/header.js"></script>
<script src="${ctx }/js/special.js"></script> 
<script src="${ctx }/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/js/login.js"></script>
<script type="text/javascript" src="${ctx }/js/header.js"></script>       
<title>专项练习</title>
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
	$(function() {
		var $t, leftX, newWidth;

		$('.menu ul').append('<div class="block"></div>');
		var $block = $('.block');

		$block.width($(".current").width()).css('left', $('.current a').position().left).data('rightLeft', $block.position().left).data('rightWidth', $block.width());

		$('.menu ul li').find('a').hover(function() {
			$t = $(this);
			leftX = $t.position().left;
			newWidth = $t.parent().width();

			$block.stop().animate({
				left: leftX,
				width: newWidth
			},300);
		}, function() {
			$block.stop().animate({
				left: $block.data('rightLeft'),
				width: $block.data('rightWidth')
			},300)
		})
	})
</script>
    </head>
    <body>
     	<!-- header-->
        <div>
            <div class="header">
                <div class="logo"> <img src="${ctx }/images/logo.png"/> </div>
                <div class="search">
							<input id="searchParam" type="text" name="searchParam" class="text"/>
    						<a href="javascrpt:search()" onclick="searchp();return false;"><input type="submit" name="" class="button" value="搜索"/></a>
					</div>
					<div class="login" id="login">
                    	<a href="${ctx }/login_use.jsp"><button id="login">登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
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
						<li><a href="${ctx }/">网站首页</a></li>
						<c:choose>
                         	 <c:when test="${fn:contains(examType,'四级')}">
								<li class="current"><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li><a href="${ctx }/category?type=六级">大学英语六级</a></li>
                         	 </c:when>
                         	 <c:otherwise>
								<li ><a href="${ctx }/category?type=四级">大学英语四级</a></li>
								<li class="current"><a href="${ctx }/category?type=六级">大学英语六级</a></li>
                         	 </c:otherwise>
                     	 </c:choose>
						<li><a href="${ctx }/about_us.jsp">关于我们</a></li>
					</ul>
				</div>
    	</div>
        <!--面包屑-->
        <div class="breadcrumb">
            <a href="${ctx }/">首页 </a>>>
            <a href="${ctx }/category?type=${examType}">${examType} </a>>> 专项练习
        </div>
        <!--左侧边栏-->
        <div class="left">
        	<h2>专项练习</h2>
            <div class="vtitle"><a href="${ctx }/examzx/list?examType=${examType}">全部</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=ListeningComprehension&examType=${examType}">听力</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=Writing&examType=${examType}">作文</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=ChooseFillInBlank&examType=${examType}">十五选十</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=QuickReading&examType=${examType}">快速阅读</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=LastReading&examType=${examType}">阅读</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/examzx/list?parentQuestionName=Translation&examType=${examType}">翻译</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="leftfoot"></div>
        </div>
        <!--右侧内容-->
        <div class="right">
            <table>
                <tr class="title">
                    <td>专项标题</td>
                    <td>类型</td>
                    <td>试卷预览</td>
                    <td>进入训练</td>
                </tr>
                <c:forEach items="${page.list}" var="zx">
                 	<tr>              
	                    <td>${zx.exam.examName}</td>
	                    <td>${zx.parentQuestionName}</td>	               
	                    <td><a href="${ctx }/examzx/preview?parentQuestionId=${zx.parentQuestionId}">查看试卷</a></td>
	                    <td><a href="${ctx }/examzx/test?parentQuestionId=${zx.parentQuestionId}"><input type="button" value="进入练习" /></a></td>
                	</tr>
                </c:forEach>
           
                <tr>
                    <td colspan="5">
                       <div class="pagecss">  
                           <span class="page"><a href="${ctx }/examzx/list?pageNum=1&parentQuestionName=${pqType}&examType=${examType}">首页</a></span>
                            <span class="page"><a href="${ctx }/examzx/list?pageNum=${page.prePageNum }&parentQuestionName=${pqType}&examType=${examType}">上一页</a></span>
                            <c:forEach begin="1" end="${page.totalPageNum }" var="pageNum"   >	
								   <span class="page"><a href="${ctx }/examzx/list?pageNum=${pageNum }&parentQuestionName=${pqType}&examType=${examType}">${pageNum }</a></span>
							</c:forEach>             
                            <span class="page" ><a href="${ctx }/examzx/list?pageNum=${page.nextPageNum} &parentQuestionName=${pqType}&examType=${examType}" >下一页</a></span>
                            <span class="page"><a href="${ctx }/examzx/list?pageNum=${page.totalPageNum }&parentQuestionName=${pqType}&examType=${examType}">尾页</a></span>                       
                        </div>                         
                    </td>
                </tr>
            </table>
        </div>
         <!--footer-->
            <div id="footer">
	             <p><a href="${ctx }/connect_us.jsp">联系我们</a> | <a href="${ctx }/talent_recruitment.jsp">人才招聘</a> | <a href="${ctx }/Teachers' cooperation.jsp">教师合作</a> | <a href="${ctx }/project_introduction.jsp">项目介绍</a></p>
	             <p>版权所有：猿计划项目小组</p>
            </div>
        <script type="text/javascript">
		function searchp(){
			var p=$("#searchParam").val();
			window . location . href = "${ctx }/exam/search?searchParam="+p;
		}
		</script>
	</body>
</html>
