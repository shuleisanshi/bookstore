<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Bookstores</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

</head>

<body class="main">

	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Cart
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td><img src="images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">Sequence</td>
													<td width="30%">Product name</td>
													<td width="10%">Price</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Count</td>
													<td width="10%">Store</td>
													<td width="10%">Total</td>
													<td width="10%">Cancel</td>
												</tr>
											</table> 
												<table width="100%" border="0" cellspacing="0">
												<!-- 定义一个总Price的变量 -->
												<c:set var="totalPrice" value="0"></c:set>
												<c:forEach items="${cart}" var="entry" varStatus="vs">
												<tr>
														<td width="10%">${vs.count}</td>
														<td width="30%">${entry.key.name }</td>

														<td width="10%">${entry.key.price}</td>
														<td width="20%">
														<input type="button" value='-' style="width:20px" onclick="changeNum(${entry.key.id},${entry.value - 1},${entry.key.pnum})">
														<input name="text" type="text"  value="${entry.value}" style="width:40px;text-align:center" /> 
														<input type="button" value='+' style="width:20px" onclick="changeNum(${entry.key.id},${entry.value + 1},${entry.key.pnum})">
														<script type="text/javascript">
															//id,商品的ID
															//num,更改后的购物数据
															//pnum就是Store
															function changeNum(id,num,pnum) {
																//alert(id + "-" + num + "-" + pnum);
																//1.购买的Count不能大于Store
																if(num > pnum){
																	alert('购买Count不能大于Store');
																	return;
																}
																
																//2.如果购买的Count为0，从购物车移除，给个提示
																if(num == 0){
																	var b = confirm('Are you sure to remove the item from cart');
																	if(b == false){
																		return;	
																	}
																}
															
																//3.如果可以进行加减，对session的购物车数据进行更新
																//alert("更新session的购物车数据");
																location.href = '${pageContext.request.contextPath}/changeNum?id='+id +'&num='+num;
															}
														</script>
														</td>
														<td width="10%">${entry.key.pnum}</td>
														<td width="10%">${entry.key.price * entry.value}</td>

														<td width="10%"><a href='${pageContext.request.contextPath}/changeNum?id=${entry.key.id}&num=0'
															style="color:#FF0000; font-weight:bold">X</a></td>
													</tr>
													<!-- 累加总Price  -->
													<c:set var="totalPrice" value="${totalPrice + entry.key.price * entry.value}"></c:set>
												</c:forEach>
													
												</table>
												


											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF6600; font-weight:bold">Total：&nbsp;&nbsp;${totalPrice}RMB</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
												<a
													href="${pageContext.request.contextPath }/showProductByPage"><img
													src="images/gwc_jx.gif" border="0" /> </a>

												&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath }/settleAccount"><img
													src="images/gwc_buy.gif" border="0" /> </a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
