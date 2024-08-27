<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>

<h2>แก้ไขคำสั่งซื้อ</h2>

<%
    Order order = (Order) session.getAttribute("order");
    if (order != null) {
%>
    <h3>ข้อมูลเดิม:</h3>
    <p>ชื่อ: <%= order.getName() %></p>
    <p>โปรเซสเซอร์: <%= order.getProcessor() %></p>
    <p>VGA: <%= order.getVga() %></p>
    <p>RAM: <%= Arrays.toString(order.getRam()) %></p>
    <p>Storage: <%= Arrays.toString(order.getStorage()) %></p>
    <p>ราคา: <%= order.getPrice() %> บาท</p>

    <form action="UpdateOrder" method="post">
        <table>
            <tr>
                <td>ชื่อ:</td>
                <td><input type="text" name="orderName" value="<%= order.getName() %>"></td>
            </tr>
            <tr>
                <td>โปรเซสเซอร์:</td>
                <td>
                    <select name="processor">
                        <!-- Add options for processors -->
                        <option value="<%= order.getProcessor() %>" selected><%= order.getProcessor() %></option>
                        <option value="Intel Core i3-13100">Intel Core i3-13100</option>
                        <option value="Intel Core i3-12100">Intel Core i3-12100</option>
                        <option value="Intel Core i3-11100">Intel Core i3-11100</option>
                        <option value="Intel Core i3-10100">Intel Core i3-10100</option>
                        <option value="Intel Core i3-9100">Intel Core i3-9100</option>
                        <option value="Intel Core i3-8100">Intel Core i3-8100</option>
                        <option value="AMD Ryzen 3 7300X">AMD Ryzen 3 7300X</option>
                        <option value="AMD Ryzen 3 7100">AMD Ryzen 3 7100</option>
                        <option value="AMD Ryzen 3 5300G">AMD Ryzen 3 5300G</option>
                        <option value="AMD Ryzen 3 3300X">AMD Ryzen 3 3300X</option>
                        <option value="AMD Ryzen 3 3100">AMD Ryzen 3 3100</option>
                        <option value="Intel Core i9-13900K">Intel Core i9-13900K</option>
                        <option value="Intel Core i7-13700K">Intel Core i7-13700K</option>
                        <option value="Intel Core i5-13600K">Intel Core i5-13600K</option>
                        <option value="Intel Core i9-12900K">Intel Core i9-12900K</option>
                        <option value="Intel Core i7-12700K">Intel Core i7-12700K</option>
                        <option value="Intel Core i5-12600K">Intel Core i5-12600K</option>
                        <option value="Intel Core i9-11900K">Intel Core i9-11900K</option>
                        <option value="Intel Core i7-11700K">Intel Core i7-11700K</option>
                        <option value="Intel Core i5-11600K">Intel Core i5-11600K</option>
                        <option value="Intel Core i9-10900K">Intel Core i9-10900K</option>
                        <option value="Intel Core i7-10700K">Intel Core i7-10700K</option>
                        <option value="Intel Core i5-10600K">Intel Core i5-10600K</option>
                        <option value="Intel Core i9-9900K">Intel Core i9-9900K</option>
                        <option value="Intel Core i7-9700K">Intel Core i7-9700K</option>
                        <option value="Intel Core i5-9600K">Intel Core i5-9600K</option>
                        <option value="AMD Ryzen 9 7950X">AMD Ryzen 9 7950X</option>
                        <option value="AMD Ryzen 7 7800X">AMD Ryzen 7 7800X</option>
                        <option value="AMD Ryzen 5 7600X">AMD Ryzen 5 7600X</option>
                        <option value="AMD Ryzen 9 5950X">AMD Ryzen 9 5950X</option>
                        <option value="AMD Ryzen 7 5800X">AMD Ryzen 7 5800X</option>
                        <option value="AMD Ryzen 5 5600X">AMD Ryzen 5 5600X</option>
                        <option value="AMD Ryzen 9 3950X">AMD Ryzen 9 3950X</option>
                        <option value="AMD Ryzen 7 3800X">AMD Ryzen 7 3800X</option>
                        <option value="AMD Ryzen 5 3600X">AMD Ryzen 5 3600X</option>
                        <option value="AMD Ryzen Threadripper 3990X">AMD Ryzen Threadripper 3990X</option>
                        <option value="AMD Ryzen Threadripper 3970X">AMD Ryzen Threadripper 3970X</option>
                        <option value="AMD Ryzen Threadripper 3960X">AMD Ryzen Threadripper 3960X</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>VGA:</td>
                <td>
                    <select name="vga">
                        <!-- Add options for VGA -->
                        <option value="<%= order.getVga() %>" selected><%= order.getVga() %></option>
                        <option value="NVIDIA GeForce RTX 4090">NVIDIA GeForce RTX 4090</option>
                        <option value="NVIDIA GeForce RTX 4080">NVIDIA GeForce RTX 4080</option>
                        <option value="NVIDIA GeForce RTX 4070">NVIDIA GeForce RTX 4070</option>
                        <option value="NVIDIA GeForce RTX 4060">NVIDIA GeForce RTX 4060</option>
                        <option value="NVIDIA GeForce RTX 3090">NVIDIA GeForce RTX 3090</option>
                        <option value="NVIDIA GeForce RTX 3080">NVIDIA GeForce RTX 3080</option>
                        <option value="NVIDIA GeForce RTX 3070">NVIDIA GeForce RTX 3070</option>
                        <option value="NVIDIA GeForce RTX 3060">NVIDIA GeForce RTX 3060</option>
                        <option value="NVIDIA GeForce RTX 2080 Ti">NVIDIA GeForce RTX 2080 Ti</option>
                        <option value="NVIDIA GeForce RTX 2080 Super">NVIDIA GeForce RTX 2080 Super</option>
                        <option value="NVIDIA GeForce RTX 2070 Super">NVIDIA GeForce RTX 2070 Super</option>
                        <option value="NVIDIA GeForce RTX 2060 Super">NVIDIA GeForce RTX 2060 Super</option>
                        <option value="AMD Radeon RX 7900 XTX">AMD Radeon RX 7900 XTX</option>
                        <option value="AMD Radeon RX 7900 XT">AMD Radeon RX 7900 XT</option>
                        <option value="AMD Radeon RX 7800 XT">AMD Radeon RX 7800 XT</option>
                        <option value="AMD Radeon RX 7700 XT">AMD Radeon RX 7700 XT</option>
                        <option value="AMD Radeon RX 6900 XT">AMD Radeon RX 6900 XT</option>
                        <option value="AMD Radeon RX 6800 XT">AMD Radeon RX 6800 XT</option>
                        <option value="AMD Radeon RX 6700 XT">AMD Radeon RX 6700 XT</option>
                        <option value="AMD Radeon RX 5700 XT">AMD Radeon RX 5700 XT</option>
                        <option value="AMD Radeon RX 5600 XT">AMD Radeon RX 5600 XT</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>RAM:</td>
                <td>
                    <input type="checkbox" name="ram" value="4GB" <%=(Arrays.asList(order.getRam()).contains("4GB") ? "checked" : "")%>>4GB
                    <input type="checkbox" name="ram" value="8GB" <%=(Arrays.asList(order.getRam()).contains("8GB") ? "checked" : "")%>>8GB<br>
                    <input type="checkbox" name="ram" value="16GB" <%=(Arrays.asList(order.getRam()).contains("16GB") ? "checked" : "")%>>16GB
                    <input type="checkbox" name="ram" value="32GB" <%=(Arrays.asList(order.getRam()).contains("32GB") ? "checked" : "")%>>32GB
                </td>
            </tr>
            <tr>
                <td>Storage:</td>
                <td>
                    <input type="checkbox" name="storage" value="120GB" <%=(Arrays.asList(order.getStorage()).contains("120GB") ? "checked" : "")%>>120GB
                    <input type="checkbox" name="storage" value="240GB" <%=(Arrays.asList(order.getStorage()).contains("240GB") ? "checked" : "")%>>240GB<br>
                    <input type="checkbox" name="storage" value="500GB" <%=(Arrays.asList(order.getStorage()).contains("500GB") ? "checked" : "")%>>500GB
                    <input type="checkbox" name="storage" value="1000GB" <%=(Arrays.asList(order.getStorage()).contains("1000GB") ? "checked" : "")%>>1000GB
                </td>
            </tr>
            <tr>
                <td>ราคา:</td>
                <td><input type="text" name="price" value="<%= order.getPrice() %>"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" value="อัปเดตคำสั่งซื้อ"></td>
            </tr>
        </table>
    </form>
<%
    } else {
%>
    <p>ไม่มีข้อมูลคำสั่งซื้อที่สามารถแก้ไขได้</p>
<%
    }
%>

<% session.removeAttribute("order"); %>
