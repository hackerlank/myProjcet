<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="${ctx }/css/header.css" type="text/css" rel="stylesheet" />
        <link href="${ctx }/css/about_us.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="${ctx }/js/jquery-1.3.1.js"/></script>
        <script src="${ctx }/js/index.js"></script>
        <script src="${ctx }/js/about_us.js"></script>
        <script src="${ctx }/js/nav.js"></script>
        <script type="text/javascript" src="${ctx }/js/header.js"></script>
        <title>关于我们</title>
    </head>
    <body>
     <!-- header-->
        <div>
            <div class="header">
                <div class="logo"> <a href="${ctx }/index_before.jsp"><img src="${ctx }/images/logo.png"/></a></div>
                <div class="search">
                <input type="text" class="text"/>
                <a href="${ctx }/search.jsp"><input type="submit" class="button" value="搜索"/></a>
                </div>
                <div class="login">
                    	<a href="${ctx }/login_use.jsp"><button>登录</button></a>&nbsp;|
						<a href="${ctx }/register.jsp"><button>注册</button></a>
                    </div>
                    
                    <div class="after_login">
                    	<div id="username">
                            <p>用户名</p>
                        </div>
                        <div class="nav" id="nav">
                            <ul>
                                <li onmousemove="showsub(this)" onmouseout="hidesub(this)"><a href="#"><img src="${ctx }/images/leftuser.jpg"></a>
                                    <ul>
                                        <li><a href="${ctx }/info/usermessage.jsp">个人信息</a></li>
			                            <li><a href="${ctx }/info/install.jsp">设置</a></li>
                                        <li><a href="${ctx }/index_before.jsp">退出登录</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
            </div>
            <div class="menu">
                <ul>
                <li><a href="${ctx }/index_before.jsp">网站首页</a></li>
                <li><a href="${ctx }/category.jsp">大学英语四级</a></li>
                <li><a href="${ctx }/category.jsp">大学英语六级</a></li>
                <li><a href="${ctx }/arena.jsp">竞技场</a></li>
                <li class="current"><a href="${ctx }/about_us.jsp">关于我们</a></li>
                </ul>
            </div>
    	</div>
        <!--面包屑-->
        <div class="breadcrumb">
            <a href="${ctx }/index_before.jsp">首页</a>>>关于我们
        </div>
        <!--左侧边栏-->
        <div class="left">
            <h2>关于我们</h2>
            <div class="vtitle"><a href="${ctx }/about_us.jsp">联系我们</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/about_us.jsp">人才招聘</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/about_us.jsp">教师合作</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="vtitle"><a href="${ctx }/about_us.jsp">项目介绍</a></div>
                <div class="vcon" style="display: none;">
            </div>
            <div class="leftfoot"></div>
        </div>
        <!--右侧内容-->
        <div class="right">
        	<div class="right_bread">
                <h1>关于我们</h1>
            </div>
            <div class="right_content" style="line-height:30px;">
                <div class="title_h1">
                	<font style="font-size:20px;font-weight:bold;">关于我们</font>
                </div>
                <div class="wenzhang_content">
                    <p style="text-align:left;line-height:1.5em;text-indent:2em;margin:0px 0px 10px">
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                     </p>
                     <p style="text-align:left;line-height:1.5em;text-indent:2em;margin:0px 0px 10px">
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                     </p>
                     <p style="text-align:left;line-height:1.5em;text-indent:2em;margin:0px 0px 10px">
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                        巨人英语是一款基于JAVA与MYSQL开发的网络考试系统，考生可以通过浏览器直接进行操作，无需安装任何程序或插件。
                     </p>
                     <p style="line-height:1.5em"> </p>
                 </div>   
             </div>
		</div>
        <!--footer-->
        <div id="footer">
  	         <p><a href="${ctx }/about_us.jsp">联系我们</a> | <a href="${ctx }/about_us.jsp">人才招聘</a> | <a href="${ctx }/about_us.jsp">教师合作</a> | <a href="${ctx }/about_us.jsp">项目介绍</a></p>
             <p>版权所有：猿计划项目小组</p>
        </div>
	</body>
</html>