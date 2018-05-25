<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStorelist</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Computer&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Book list
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>Product list</h1>
								<hr />
								<h1>Computer</h1>&nbsp;&nbsp;&nbsp;&nbsp;All${pageResult.totalCount} books
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="images/productlist.gif" width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${pageResult.list}" var="product">
											<td>
												<div class="divbookpic">
													<p>
														<a href="${pageContext.request.contextPath}/productInfo?id=${product.id}"><img src="${pageContext.request.contextPath}/${product.imgurl}" width="115"
															height="129" border="0" /> </a>
													</p>
												</div>
	
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/productInfo?id=${product.id}">Name:${product.name }<br />Price:${product.price } </a>
												</div>
											</td>
										</c:forEach>

									</tr>
								</table>
								<div class="pagination">
									page ${pageResult.currentPage} /  all ${pageResult.totalPage} pages
									<ul>
										<!-- 1.Last -->
										<c:if test="${pageResult.currentPage == 1}">
											<li class="disablepage">Last page &lt;&lt;</li>
										</c:if>
										<c:if test="${pageResult.currentPage != 1}">
											<li ><a href="${pageContext.request.contextPath}/showProductByPage?category=${category}&page=${pageResult.currentPage - 1}">Last &lt;&lt;</a></li>
										</c:if>
										<!-- <li class="currentpage">1</li> -->
										<!-- 2.显示分页 -->
										<c:forEach begin="1" end="${pageResult.totalPage}" var="i">
											<li><a href="${pageContext.request.contextPath}/showProductByPage?category=${category}&page=${i}">${i}</a></li>
										</c:forEach>
										
										
										<!-- 3.Next -->
										<c:if test="${pageResult.currentPage == pageResult.totalPage}">
											<li class="disablepage">Next page &gt;&gt;</li>
										</c:if>

										<c:if test="${pageResult.currentPage != pageResult.totalPage}">
											<li class="nextpage"><a href="${pageContext.request.contextPath}/showProductByPage?category=${category}&page=${pageResult.currentPage + 1}">Next&gt;&gt;</a></li>
										</c:if>
										
									</ul>
								</div>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
