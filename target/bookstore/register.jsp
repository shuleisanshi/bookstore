`<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>bookStore注册页面</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<script type="text/javascript">
	function changeImage() {

		document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
				+ new Date().getTime();
	}
</script>
</head>


<body class="main">
	<%@include file="head.jsp"%>
	<%--导入头 --%>
	<%@include file="menu_search.jsp"%><%--导入导航条与搜索 --%>

	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/user?action=register"
			method="post">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>New member </h1>
						
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
							<td></td>
							<td><font color="red">${register_err}</font></td>
							<td></td>
							</tr>
							<tr>
								<td style="text-align:right; width:20%">Mailbox：</td>
								<td style="width:40%">
								<input type="text" class="textinput"
									name="email" /></td>
								<td><font color="#999999">Please input mailbox</font></td>
							</tr>
							<tr>
								<td style="text-align:right">Username：</td>
								<td>
									<input type="text" class="textinput" name="username" />
								</td>
								<td><font color="#999999">Username more than 6 letters</font></td>
							</tr>
							<tr>
								<td style="text-align:right">Password：</td>
								<td><input type="password" class="textinput"
									name="password" /></td>
								<td><font color="#999999">Password more than 6 letters</font></td>
							</tr>
							<tr>
								<td style="text-align:right">Re input：</td>
								<td><input type="password" class="textinput"
									name="repassword" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">Gender：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="Man" checked="checked" /> Man
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="Woman" /> Woman</td>
							</tr>
							<tr>
								<td style="text-align:right">Contact：</td>
								<td colspan="2"><input type="text" class="textinput"
									style="width:350px" name="telephone" /></td>
							</tr>
							<tr>
								<td style="text-align:right">Brief：</td>
								<td colspan="2"><textarea class="textarea" name="introduce"></textarea>
								</td>
							</tr>

						</table>



						<h1>Check</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">Input checkcode：</td>
								<td style="width:50%">
								<input type="text" class="textinput" name="checkcode"/>
								<font color="red">${checkcode_err}</font>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img
									src="${pageContext.request.contextPath}/imageCode" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">Change</a>
								</td>
							</tr>
						</table>



						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center"><input
									type="image" src="images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; Shu lei All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div>


</body>
</html>
