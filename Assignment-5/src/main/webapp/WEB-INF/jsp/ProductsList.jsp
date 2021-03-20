<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/31/20
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Products</title>
</head>
<body>


<br>

<table border="1" width="80%">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Action</th>

    </tr>
    <c:forEach var="products" items="${productsList}">
        <tr>
            <td>${products.id}</td>
            <td>${products.name}</td>
            <td>${products.price}</td>

            <td>
                <a href="addcart/${products.id}">Shopping Cart</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
