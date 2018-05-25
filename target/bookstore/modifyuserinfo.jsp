<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">MyAccount</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath }/findUserById?id=${user.id}">UserInfo modify</a></td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="orderlist.jsp">Order search</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/user?action=logout">Logout</a>
							</td>
						</tr>
					</table></td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;MyAccount</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;UserInfo Modify
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form action="${pageContext.request.contextPath }/modifyUserInfo" method="post">
									<input type="hidden" name="id" value="${u.id}">
									<table width="100%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:20%">Mailbox：</td>
											<td style="width:40%; padding-left:20px">${u.email }</td>
											<td>&nbsp;</td>


										</tr>
										<tr>
											<td style="text-align:right">Username：</td>
											<td style="padding-left:20px">${u.username}</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">Password modify：</td>
											<td><input type="password" name="password"
												class="textinput" />
											</td>
											<td><font color="#999999"></font>
											</td>
										</tr>
										<tr>
											<td style="text-align:right">Reinput：</td>
											<td><input type="password" class="textinput" />
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">Gender：</td>
											<td colspan="2">&nbsp;&nbsp;
											<!--  checked="checked" 
												判断：1，jstl=c:if
												      2,el 判断功能
											 -->
											<input type="radio" name="gender" value="Man" ${u.gender == 'Man' ? 'checked="checked"' : ''}/>Man&nbsp;&nbsp;
											<input type="radio" name="gender" value="Woman" ${u.gender == 'Woman' ? 'checked="checked"' : ''}/> Woman</td>
										</tr>
										<tr>
											<td style="text-align:right">Contact：</td>
											<td colspan="2"><input name="telephone" type="text"
												value="${u.telephone }" class="textinput" />
											</td>
										</tr>

										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>





									<p style="text-align:center">

										<input type="image" src="images/botton_gif_025.gif" border="0">

									</p>
									<p style="text-align:center">&nbsp;</p>
								</form></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
