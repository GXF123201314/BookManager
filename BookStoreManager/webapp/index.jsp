<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="pages/lib/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="pages/lib/jquery.cookie.js"></script>
<script type="text/javascript"
	src="pages/lib/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="pages/lib/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="pages/lib/ValidateUtil.js"></script>

<link rel="stylesheet"
	href="pages/lib/jquery-easyui-1.7.0/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="pages/lib/jquery-easyui-1.7.0/themes/icon.css" type="text/css"></link>
<title>BSM</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 60px;"></div>
	<div data-options="region:'south'" style="height: 60px;"></div>
	<div data-options="region:'west'" style="width: 200px;">
		<div class="easyui-panel"
			data-options="title:'功能导航',border:false,fit:true">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="系统菜单" data-options="iconCls:'icon-save'">
					<ul id="layout_west_tree" class="easyui-tree"
						data-options="
					url : '${pageContext.request.contextPath}/menuAction!getAllTreeNote.action',
					parentField : 'pid',
					lines : true,
					onClick : function(node) {
						if (node.attributes.url) {
							var url = '${pageContext.request.contextPath}' + node.attributes.url;
							addTab({
								title : node.text,
								closable : true,
								href : url
							});
						}
					}
					"></ul>
				</div>
				<div title="Title2" data-options="iconCls:'icon-reload'"></div>
			</div>
		</div>
	</div>
	<div data-options="region:'east',title:'East'" style="width: 200px;">
	</div>
	<!-- 中间tab内容显示 -->
	<div data-options="region:'center'">
		<div id="index_centerTab" class="easyui-tabs"
			data-options="fit:true,border:false">
			<div title="首页"></div>
		</div>
	</div>
</body>
<!-- 登录弹窗 -->
<div id="user_login_loginDialog" class="easyui-dialog"
	data-options="title:'登录',closable:false,modal:true,
			buttons:[{
				text:'注册',
				handler:function(){
				$('#user_reg_regDialog').dialog('open');
				}
			},{
				text:'登录',
				handler:function(){
				$('#user_login_loginForm').submit();
				}
			}]">
	<form id="user_login_loginForm" method="post">
		<table>
			<tr>
				<th>登录名</th>
				<td><input name="name" class="easyui-validatebox"
					data-options="required:true,missingMessage:'登陆名称必填'" /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input type="password" name="pwd"
					class="easyui-validatebox"
					data-options="required:true,missingMessage:'登陆密码必填'" /></td>
			</tr>
		</table>
	</form>
</div>
<!-- 注册弹窗 -->
<div id="user_reg_regDialog" style="width: 250px;" class="easyui-dialog"
	data-options="title:'注册',closed:true,modal:true,buttons:[{
				text:'注册',
				iconCls:'icon-edit',
				handler:function(){
					$('#user_reg_regForm').submit();
				}
			}]">
	<form id="user_reg_regForm" method="post">
		<table>
			<tr>
				<th>登录名</th>
				<td><input name="name" class="easyui-validatebox"
					data-options="required:true,missingMessage:'登陆名称必填'" validType="validateSameName" /></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input name="pwd" type="password"
					class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<th>重复密码</th>
				<td><input name="rePwd" type="password"
					class="easyui-validatebox"
					data-options="required:true,validType:'eqPwd[\'#user_reg_regForm input[name=pwd]\']'" /></td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	//新增tab页签
	function addTab(opts) {
		var t = $('#index_centerTab');
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
		} else {
			t.tabs('add', opts);
		}
	}
	$(function() {
		$('#user_login_loginForm').form({
			url : '${pageContext.request.contextPath}/userAction!login.action',
			success : function(r) {
				var obj = jQuery.parseJSON(r);
				if (obj.success) {
					/* 登录成功把Token和refreshToken放到cookies中 */
					$.cookie('token', obj.obj.token);
					$.cookie('refreshToken', obj.obj.refreshToken);
					$('#user_login_loginDialog').dialog('close');
				}
				$.messager.show({
					title : '提示',
					msg : obj.msg
				});
			}
		});
		$('#user_login_loginForm input').bind('keyup', function(event) {/* 增加回车提交功能 */
			if (event.keyCode == '13') {
				$('#user_login_loginForm').submit();
			}
		});

		if (typeof($.cookie("token")) != "undefined" && $.cookie("token").length > 0) {
			$('#user_login_loginDialog').dialog('close');
		}

		$('#user_reg_regForm').form({
			url : '${pageContext.request.contextPath}/userAction!reg.action',
			success : function(r) {
				var obj = jQuery.parseJSON(r);
				if (obj.success) {
					$('#user_reg_regDialog').dialog('close');
				}
				$.messager.show({
					title : '提示',
					msg : obj.msg
				});
			}
		});
		$('#user_reg_regForm input').bind('keyup', function(event) {/* 增加回车提交功能 */
			if (event.keyCode == '13') {
				$('#user_reg_regForm').submit();
			}
		});

	});
</script>
</html>