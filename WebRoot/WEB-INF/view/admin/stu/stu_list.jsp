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
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
		</div>
	</div>  
	<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({    
		    url:'/ssm_easy01/stu/list.action',    
		    title:' ',
		    columns:[[
		        {field:'id',title:'学生编号',width:100,align:"center"},    
		        {field:'name',title:'学生姓名',width:100,align:"center"},    
		        {field:'birthday',title:'出生日期',width:100,align:"center"},
		        {field:'gname',title:'班级名称',align:"center",width:100,formatter:function(val,row,index){if(row.grade){return row.grade.gname}}},
		        {field:'count',title:'课程数量',width:100,align:"center"},
		        {field:'cptime',title:'所花时间',width:100,align:"center"},
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
		    	text:"添加学生",
				iconCls: 'icon-add',
				handler: function(){
					$("#dd").dialog({title:"添加页面"});
					$('#ff').form('clear');
					$('#dd').dialog('open');
				}
			},'-',{
				text:"删除学生",
				iconCls: 'icon-remove',
				handler: function(){
					var row=$("#dg").datagrid("getSelected");
					if(row==null){
						alert("请选择一行数据");
					}else{
						$.ajax({
							type:"post",
							data:{"id":row.id},
							dataType:"json",
							url:"/ssm_easy01/stu/delete.action",
							success:function(data){
								if(data){
									alert("删除成功");
									$("#dd").dialog('close');
									$('#dg').datagrid('reload');
								}else{
									alert("删除失败")
								}
							}
						})
					}
				}
			},'-',{
				text:"选课操作",
				iconCls: 'icon-edit',
				handler: function(){
					var row=$("#dg").datagrid("getSelected");
					if(row==null){
						alert("请选择一行数据");
					}else{
						$("#dd").dialog({title:"修改页面"});
						$("#ff").form("load",row);
						$('#dd').dialog('open');
					}
					
				}
			}]
	
		}); 
		$('#dd').dialog({    
		    width: 800,    
		    height:300,
		    closed: true,
		  //  href:"/ssm_easy01/stu/toStuAdd.action"
		});    
		/* $('#ddu').dialog({    
		    width: 800,    
		    height:300,
		    closed: true,
		});     */
	});
	 function submitForm(){
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
</body>
</html>