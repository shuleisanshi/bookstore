<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">MyAccount</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="modifyuserinfo.jsp">UserInfo modify</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/order?action=findOrderById">Order search</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">Logout</a></td>
						</tr>
















					</table>
				</td>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;MyAccount</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Order search
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>Welcome ${user.username} to the bookstore！</p>
								<p>
									You have<font style="color:#FF0000">${fn:length(orders)}</font> orders
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">Order number</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">Receiver</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">Order time</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">Status</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">Operation</td>
									</tr>


									<c:forEach items="${orders}" var="order" varStatus="vs">
										<tr>
											<td class="tableopentd02">${order.id}</td>
	
											<td class="tableopentd02">${order.receiverName}</td>
											<!-- 掌握如何在jsp格式化时间,用一个fmt标签 -->
											<td class="tableopentd02">
												<fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
											<td class="tableopentd02">${order.paystate == 1 ? '已支付' : '未支付'}</td>
											<td class="tableopentd03">
												<a href="${pageContext.request.contextPath}/findOrderByOrderId?orderId=${order.id}">Examine</a>&nbsp;&nbsp;
												<a href="#">Delete</a>
											</td>
										</tr>
									</c:forEach>

									
								
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" />
				</td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a>
				</td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; Shu lei All Rights RESERVED.</b> </font>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>
