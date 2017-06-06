<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>My JSP 'index.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/3rd-party/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/3rd-party/easyUI/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/3rd-party/easyUI/locale/easyui-lang-zh_CN.js"></script>
  	</head>
<body>
<script type="text/javascript">
	function submitForm_addStu(){
			$.ajax({
				type:"post",
				data:$("#ff").serialize(),
				dataType:"json",
				url:"/ssm_easy01/stu/add.action",
				success:function(data){
					if(data){
						alert("保存成功");
						$("#dd").dialog('close');
						$('#dg').datagrid('reload');
					}else{
						alert("保存失败");
					}
				}
			})
	}
</script>
<table id="dg"></table>  
<div id="dd" class="easyui-panel">
	<form id="ff">
	    	<table cellpadding="5">
	    		<tr>
	    			<th>学生名称:<input class="easyui-textbox" type="hidden" name="id"/></th>
	    			<th><input class="easyui-validatebox" type="text" name="name" data-options="required:true" style="width: 230px;"/></th>
	    		</tr>
	    		<tr>
	    			<th>出生日期:</th>
	    			<th><input class="easyui-validatebox" type="text" name="birthday" data-options="required:true" style="width: 230px;"/></th>
	    		</tr>
	    		<tr>
	    			<th>班级名称:</th>
	    			<th>
	    				<input class="easyui-combobox" name="gid" data-options="url:'../grade/getGradeTypeList.action',method:'post',valueField:'gid',textField:'gname',multiple:false,panelHeight:'auto'">
	    			</th>
	    		</tr>
	    		<tr>
	    			<th>所选课程:</th>
	    			<th>
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="1">coreJava
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="2">javaWeb
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="3">javaScript
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="4">cms
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="5">OA
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="6">ssh
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="7">ssm
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="8">小实训
	    			<input class="easyui-validatebox" type="checkbox" name="cid" value="9">大实训
	    			</th>
	    		</tr>
	    	</table>
	    </form>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm_addStu()" style="width:80px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
		</div> 
</div>
</body>
</html>