		$(function(){
			$('#dg').datagrid({    
			    url:'stu/list.action',    
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
								url:"stu/delete.action",
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
			});    
		})
		function submitForm(){
				$.ajax({
					type:"post",
					data:$("#ff").serialize(),
					dataType:"json",
					url:"stu/add.action",
					success:function(data){
						if(data){
							alert("添加成功");
							$("#dd").dialog('close');
							$('#dg').datagrid('reload');
						}else{
							alert("添加失败")
						}
					}
				})
	  }