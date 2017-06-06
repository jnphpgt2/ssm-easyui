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
	function loginadmin(){
		$("form").submit();
	}
</script>
<body>
<center>
<div style="margin:150px 0;"></div>
<form action="<%=request.getContextPath()%>/admin/loginadmin.action">
	<div class="easyui-panel" title="学生内部管理系统" style="width:100%;max-width:400px;padding:30px 60px;">
		<div style="margin-bottom:10px">
			<input class="easyui-textbox" name="aname" style="width:100%;height:40px;padding:12px" data-options="prompt:'请输入用户名',iconCls:'icon-man',iconWidth:38">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="apwd" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'请输入密码',iconCls:'icon-lock',iconWidth:38">
		</div>
		<div>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;" onclick="loginadmin()">
				<span style="font-size:14px;">登录</span>
			</a>
		</div>
	</div>
</form>
</center>
</body>
</html>