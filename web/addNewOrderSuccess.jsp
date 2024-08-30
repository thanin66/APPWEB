<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order, java.util.Arrays" %>

<h2>เพิ่มคำสั่งซื้อสำเร็จ</h2>
<%
    Order order = (Order) session.getAttribute("order"); 
%>
ชื่อ: <%= order.getName() %><br/>
โปรเซสเซอร์: <%= order.getProcessor() %><br/>
VGA: <%= order.getVga() %><br/>
RAM: <%= Arrays.toString(order.getRam()) %><br/>
Storage: <%= Arrays.toString(order.getStorage()) %><br/>
ราคา: <%= order.getPrice() %><br/>

<br/>
<a href="index.html">กลับไปที่หน้าแรก</a>
<br/>
<br/>
<a href="addNewOrder.jsp">กลับไปที่ฟอร์มคำสั่งซื้อ</a>
<br/>
<br/>
<a href="listOrders.jsp">List Orders</a>
<br/>