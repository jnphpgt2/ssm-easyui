<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/3rd-party/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/3rd-party/easyUI/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/locale/easyui-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
	function addTabs(title,url){
		var flag=$("#tt").tabs("exists",title);
		if(!flag){
			$('#tt').tabs('add',{    
			    title:title,    
			    closable:true,
			 	href:url
			}); 
		}else{
			$("#tt").tabs("select",title);
		}
	}
</script>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:70px;background:#B3DFDA;padding:4px">
	<h1 style="font-size:x-large;float: left;">八维学生管理系统</h1>
	<span style="float: right;font-size: 14px;margin-top: 38px;margin-right: 10px">当前用户 ： ${sessionScope.admins.aname}</span>
	</div>
	<div data-options="region:'west',split:true,title:'导航栏'" style="width:150px;padding:10px;">
		------管理列表-----
		<input type="button" value="学生信息管理" onclick="addTabs('学生信息管理','stu_list.action')">
		<input type="button" value="班级信息管理" onclick="addTabs('班级信息管理','grade_list.action')">
		<input type="button" value="课程信息管理" onclick="addTabs('课程信息管理','course_list.action')">
	</div>
	<div data-options="region:'center',border:false">
		<div id="tt" class="easyui-tabs" data-options="tools:'#tab-tools',fit:true" style="width:700px;height:250px">
			<div title="首页" style="padding:10px">
				<h1 style="font-size:80px;text-align: center;padding-top: 70px;font-family:'楷体';color: red">欢迎使用</h1>
			</div>
		</div>
	</div>
</body>
</html>