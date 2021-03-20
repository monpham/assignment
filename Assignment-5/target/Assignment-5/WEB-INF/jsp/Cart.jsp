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
    <title>List Shopping Cart</title>
</head>
<body>


<br>
<a href="/Assignment_5_war_exploded" >
  Shopping  <c:out value="${sessionScope.myCartNum == null ? 0 : sessionScope.myCartNum}"/>
</a>
<form class="cart__form">
<table border="1" width="80%">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Remove</th>
    </tr>
    <c:forEach var="map" items="${sessionScope.myCartItems}">
        <tr>
            <td>
                <a href="#">${map.value.products.name}</a>
                <br><c:out value="${map.value.products.name}"/><br>
            </td>
            <td class="product__price">
                <div class="price">
                    <span class="new__price">${map.value.products.price}</span>
                </div>
            </td>
            <td class="product__quantity">
                <div class="input-counter">
                    <div>
                        <input type="text" min="1" value="${map.value.quantity}" max="10" class="counter-btn">
                    </div>
                </div>
            </td>
            <td class="product__subtotal">
                <div class="price">
                    <span class="new__price">$${map.value.quantity * map.value.products.price}</span>
                </div>
            </td>
                <td>
                <a href="/Assignment_5_war_exploded/remove/${map.value.products.id}" class="remove__cart-item">
             Remove
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
    <div class="cart__totals">
        <h3>Cart Totals</h3>
        <ul>
            <li>
                Subtotal
                <span class="new__price">$${sessionScope.myCartTotal}</span>
            </li>
            <li>
                VAT (10%)
                <span>$${sessionScope.myCartTotal * 0.1}</span>
            </li>
            <li>
                Total
                <span class="new__price">$${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}</span>
            </li>
        </ul>
        <a href="/Assignment_5_war_exploded/checkoutform">PROCEED TO CHECKOUT</a>
    </div>
</form>
</body>
</html>
