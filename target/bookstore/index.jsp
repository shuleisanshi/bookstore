<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bookStore Homepage</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>

<body class="main">

	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<div id="divad">
		<img src="ad/index_ad.jpg" />
	</div>

	<div id="divcontent">
		<table width="900px" border="0" cellspacing="0">
			<tr>
				<td width="497"><img src="images/billboard.gif" width="497"
					height="38" />
					<table cellspacing="0" class="ctl">
						<tr>
							<td>&middot;<a href="login.jsp" style="color:#000000">Do not regret, you will get a 30% discount</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="login.jsp" style="color:#000000">Lonely
									Online browsing and online shopping</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="login.jsp" style="color:#000000">Apply for a VIP member, and you will get a 50% discount</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="login.jsp" style="color:#000000">Over 500000 books, you can get everything you want</a></td>
						</tr>
						<tr>
							<td>&middot;<a href="login.jsp" style="color:#000000">Login everday, we will provide good gifts</a></td>
						</tr>
					</table></td>
				<td style="padding:5px 15px 10px 40px"><table width="100%"
						border="0" cellspacing="0">
						<tr>
							&nbsp;&nbsp;<td><img src="images/hottitle.gif" width="126" height="29" />
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0">
						<tr>
							<td style="width:50; text-align:center"><a href="login.jsp"><img
									src="bookcover/mybook.JPG" width="102" height="130"
									border="0" /> </a><br /> <a href="info.html">my book<br />
									Writer:Lonley Plant</a></td>
							<td style="width:50; text-align:center"><a href="login.jsp"><img
									src="bookcover/master.JPG" width="102" height="130" border="0" />
							</a><br /> <a href="info.html">Master <br /> Writer:new east</a>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp"/>


</body>
</html>
