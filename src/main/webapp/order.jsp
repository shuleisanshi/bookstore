<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript">
	//掌握如何通过js提交表单，而不是通过submit按钮来提交
	function createOrder() {
		
		//获取表单标签，调用sumbit方法就可以了
		document.getElementById('orderForm').submit();
	}
</script>

</head>


<body class="main">
	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="cart.jsp">&nbsp;Cart</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Order
					</div>

					<form id="orderForm" action="${pageContext.request.contextPath }/createOrder" method="post">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td><table width="100%" border="0" cellspacing="0">
										<tr>
											<td><img src="images/buy2.gif" width="635" height="38" />
												<p>Hello：${user.username }Sir！Welcome to the settlement center.</p></td>
										</tr>
										<tr>
											<td><table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">Sequence</td>
														<td width="40%">Product name</td>
														<td width="10%">Price</td>
														<td width="10%">Category</td>
														<td width="10%">Count</td>
														<td width="10%">Total</td>

													</tr>
												</table>

												<table width="100%" border="0" cellspacing="0">
												<!-- 定义一个总Price的变量 -->
												<c:set var="totalPrice" value="0"></c:set>
												<c:forEach items="${cart}" var="entry" varStatus="vs">
													<tr>
														<td width="10%">${vs.count }</td>
														<td width="40%">${entry.key.name }</td>
														<td width="10%">${entry.key.price }</td>
														<td width="10%">${entry.key.category }</td>
														<td width="10%"><input name="text" type="text"
															value="${entry.value}" style="width:20px" readonly="readonly" /></td>
														<td width="10%">${entry.key.price * entry.value}</td>
													</tr>
													<!-- 累加总Price  -->
													<c:set var="totalPrice" value="${totalPrice + entry.key.price * entry.value}"></c:set>
												</c:forEach>
													
												</table>


												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align:right; padding-right:40px;"><font
															style="color:#FF0000">Total：&nbsp;&nbsp;${totalPrice}RMB</font></td>
													</tr>
												</table>

												<p>
													Address：<input name="receiverAddress" type="text" value="xxx"
														style="width:350px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
													<br /> Receiver：&nbsp;&nbsp;&nbsp;&nbsp;<input
														name="receiverName" type="text" value="xxx"
														style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
													<br /> Contact：<input type="text" name="receiverPhone"
														value="xxx" style="width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;

												</p>
												<hr />
												<p style="text-align:right">
													<img src="images/gif53_029.gif" width="204" height="51"
														border="0" onclick="createOrder()"/>
												</p></td>
										</tr>
									</table></td>
							</tr>
						</table>
					</form></td>
			</tr>
		</table>
	</div>


	<jsp:include page="foot.jsp" />


</body>
</html>
