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
<script type="text/javascript">

</script>
<body>
<script type="text/javascript">
	$(function(){
		$('#dg_grade').datagrid({    
		    url:'/ssm_easy01/grade/list.action',    
		    title:' ',
		    columns:[[
		        {field:'gid',title:'班级编号',width:100,align:"center"},    
		        {field:'gname',title:'班级名称',width:100,align:"center"},    
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
		    	text:"添加班级",
				iconCls: 'icon-add',
				handler: function(){
					$("#dd_grade").dialog({title:"添加页面"});
					$('#ff_grade').form('clear');
					$('#dd_grade').dialog('open');
				}
			},'-',{
				text:"删除班级",
				iconCls: 'icon-remove',
				handler: function(){
					var row=$("#dg_grade").datagrid("getSelected");
					if(row==null){
						alert("请选择一行数据");
					}else{
						$.ajax({
							type:"post",
							data:{"gid":row.gid},
							dataType:"json",
							url:"/ssm_easy01/grade/delete.action",
							success:function(data){
								if(data){
									alert("删除成功");
									$("#dd_grade").dialog('close');
									$('#dg_grade').datagrid('reload');
								}else{
									alert("删除失败")
									}
								}
							})
						}
					}
				},'-',{
				text:"修改班级",
				iconCls: 'icon-edit',
				handler: function(){
						var row=$("#dg_grade").datagrid("getSelected");
						if(row==null){
							alert("请选择一行数据");
						}else{
							$("#dd_grade").dialog({title:"修改页面"});
							$("#ff_grade").form("load",row);
							$('#dd_grade').dialog('open');
						}
					}
				}]
		}); 
				$('#dd_grade').dialog({    
				    width: 800,    
				    height:300,
				    closed: true,    
				});    
	})
	function submitForm(){
			$.ajax({
				type:"post",
				data:$("#ff_grade").serialize(),
				dataType:"json",
				url:"/ssm_easy01/grade/add.action",
				success:function(data){
					if(data){
						alert("保存成功");
						$("#dd_grade").dialog('close');
						$('#dg_grade').datagrid('reload');
					}else{
						alert("保存失败")
					}
				}
			})
	}
</script>
<table id="dg_grade"></table>  
	<div id="dd_grade" >
		<form id="ff_grade">
	    	<table cellpadding="5">
	    		<tr>
	    			<th>班级名称:<input class="easyui-textbox" type="hidden" name="gid"/></th>
	    			<th><input class="easyui-textbox" type="text" name="gname" data-options="required:true" style="width: 230px;"/></th>
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