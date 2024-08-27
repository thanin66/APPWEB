
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h2>Add New Order</h2>
<form action="AddNewOrderMySQL" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" required></td> <!-- Parameter name is 'name' -->
        </tr>
        <tr>
            <td>Processor:</td>
            <td>
                <select name="processor">
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
                <input type="checkbox" id="ram4gb" name="ram" value="4GB">
                <label for="ram4gb">4GB</label><br>
                <input type="checkbox" id="ram8gb" name="ram" value="8GB">
                <label for="ram8gb">8GB</label><br>
                <input type="checkbox" id="ram12gb" name="ram" value="12GB">
                <label for="ram12gb">12GB</label><br>
                <input type="checkbox" id="ram24gb" name="ram" value="24GB">
                <label for="ram24gb">24GB</label><br>
                <input type="checkbox" id="ram36gb" name="ram" value="36GB">
                <label for="ram36gb">36GB</label><br>
                <input type="checkbox" id="ram64gb" name="ram" value="64GB">
                <label for="ram64gb">64GB</label><br>
                <input type="checkbox" id="ram128gb" name="ram" value="128GB">
                <label for="ram128gb">128GB</label>
            </td>
        </tr>
        <tr>
            <td>Storage:</td>
            <td>
                <input type="checkbox" id="storage120gb" name="storage" value="120GB">
                <label for="storage120gb">120GB</label><br>
                <input type="checkbox" id="storage240gb" name="storage" value="240GB">
                <label for="storage240gb">240GB</label><br>
                <input type="checkbox" id="storage500gb" name="storage" value="500GB">
                <label for="storage500gb">500GB</label><br>
                <input type="checkbox" id="storage1000gb" name="storage" value="1000GB">
                <label for="storage1000gb">1000GB</label><br>
                <input type="checkbox" id="storage2000gb" name="storage" value="2000GB">
                <label for="storage2000gb">2000GB</label><br>
                <input type="checkbox" id="storage4000gb" name="storage" value="4000GB">
                <label for="storage4000gb">4000GB</label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="Add Order"></td>
        </tr>
    </table>
</form>