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
	$(function(){
		$('#dg_course').datagrid({    
		    url:'/ssm_easy01/course/list.action',    
		    title:' ',
		    columns:[[
		        {field:'cid',title:'课程编号',width:100,align:"center"},    
		        {field:'cname',title:'课程名称',width:100,align:"center"},    
		        {field:'ptime',title:'花费时间',width:100,align:"center"},
		    ]],
		    fitColumns:true,
		    striped:true,
		 // sortName:"id",
		    pagination:true,
		    collapsible:true,
		    pageSize:8,
		    pageList:[2,4,6,8,10],
		    rownumbers:true,
		    singleSelect:true,
		    toolbar: [{
		    	text:"添加课程",
				iconCls: 'icon-add',
				handler: function(){
					$("#dd_course").dialog({title:"添加页面"});
					$('#ff_course').form('clear');
					$('#dd_course').dialog('open');
				}
			},'-',{
				text:"删除课程",
				iconCls: 'icon-remove',
				handler: function(){
					var row=$("#dg_course").datagrid("getSelected");
					if(row==null){
						alert("请选择一行数据");
					}else{
						$.ajax({
							type:"post",
							data:{"cid":row.cid},
							dataType:"json",
							url:"/ssm_easy01/course/delete.action",
							success:function(data){
								if(data){
									alert("删除成功");
									$("#dd_course").dialog('close');
									$('#dg_course').datagrid('reload');
								}else{
									alert("删除失败")
									}
								}
							})
						}
					}
				},'-',{
				text:"修改课程",
				iconCls: 'icon-edit',
				handler: function(){
					var row=$("#dg_course").datagrid("getSelected");
					if(row==null){
						alert("请选择一行数据");
					}else{
						$("#dd_course").dialog({title:"修改页面"});
						$("#ff_course").form("load",row);
						$('#dd_course').dialog('open');
					}
					
				}
			}]
	
		}); 
		$('#dd_course').dialog({    
		    width: 800,    
		    height:300,
		    closed: true,    
		});    
	})
	function submitForm(){
			$.ajax({
				type:"post",
				data:$("#ff_course").serialize(),
				dataType:"json",
				url:"/ssm_easy01/course/add.action",
				success:function(data){
					if(data){
						alert("保存成功");
						$("#dd_course").dialog('close');
						$('#dg_course').datagrid('reload');
					}else{
						alert("保存失败")
					}
				}
			})
	}
</script>
<table id="dg_course"></table>  
	<div id="dd_course" >
		<form id="ff_course">
	    	<table cellpadding="5">
	    		<tr>
	    			<th>课程名称:<input class="easyui-textbox" type="hidden" name="cid"/></th>
	    			<th><input class="easyui-textbox" type="text" name="cname" data-options="required:true" style="width: 230px;"/></th>
	    		</tr>
	    		<tr>
	    			<th>花费时间:</th>
	    			<th><input class="easyui-textbox" type="text" name="ptime" data-options="required:true" style="width: 230px;"/></th>
	    		</tr>
	    	</table>
	    </form>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
		</div>
	</div>  
</body>
</html>