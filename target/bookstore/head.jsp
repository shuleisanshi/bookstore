<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td><a href="index.jsp"><img src="images/logo.png"
					width="95" height="30" border="0" /> </a></td>
			<td style="text-align:right"><img src="images/cart.gif"
				width="26" height="23" style="margin-bottom:-4px" />&nbsp;<a
				href="cart.jsp">Cart</a> | <a href="#">Help</a> | <a href="${pageContext.request.contextPath }/myacount">My account(${user.username})</a>
				| <a href="register.jsp">Register</a></td>
		</tr>
	</table>
</div>