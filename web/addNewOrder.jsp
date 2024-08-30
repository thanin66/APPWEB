<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #4CAF50;
            text-align: center;
        }
        .form-container table {
            width: 100%;
        }
        .form-container td {
            padding: 8px;
            vertical-align: top;
        }
        .form-container input[type="text"],
        .form-container select {
            width: 100%;
            padding: 8px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="checkbox"] {
            margin-right: 10px;
        }
        .form-container label {
            margin-right: 20px;
        }
        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function updatePrice() {
            const processorPrice = {
                "potato": 5,
                "Intel Core i3-13100": 3000,
                "Intel Core i3-12100": 2800,
                "Intel Core i5-13600K": 10000,
                "Intel Core i7-13700K": 15000,
                "Intel Core i3-13100": 3000,
                "Intel Core i3-12100": 2800,
                "Intel Core i3-11100": 2600,
                "Intel Core i3-10100": 2400,
                "Intel Core i3-9100": 2200,
                "Intel Core i3-8100": 2000,
                "Intel Core i5-13600K": 10000,
                "Intel Core i5-12600K": 9000,
                "Intel Core i5-11600K": 8000,
                "Intel Core i5-10600K": 7000,
                "Intel Core i5-9600K": 6000,
                "Intel Core i7-13700K": 15000,
                "Intel Core i7-12700K": 14000,
                "Intel Core i7-11700K": 13000,
                "Intel Core i7-10700K": 12000,
                "Intel Core i7-9700K": 11000,
                "Intel Core i9-13900K": 20000,
                "Intel Core i9-12900K": 18000,
                "Intel Core i9-11900K": 16000,
                "Intel Core i9-10900K": 15000,
                "Intel Core i9-9900K": 14000,
                "AMD Ryzen 3 7300X": 3000,
                "AMD Ryzen 3 7100": 2800,
                "AMD Ryzen 3 5300G": 2600,
                "AMD Ryzen 3 3300X": 2400,
                "AMD Ryzen 3 3100": 2200,
                "AMD Ryzen 5 5600X": 7000,
                "AMD Ryzen 5 7600X": 9000,
                "AMD Ryzen 7 3800X": 10000,
                "AMD Ryzen 7 7800X": 12000,
                "AMD Ryzen 7 5800X": 11000,
                "AMD Ryzen 9 7950X": 20000,
                "AMD Ryzen 9 5950X": 18000,
                "AMD Ryzen 9 3950X": 16000,
                "AMD Ryzen Threadripper 3990X": 70000,
                "AMD Ryzen Threadripper 3970X": 65000,
                "AMD Ryzen Threadripper 3960X": 60000

            };

            const vgaPrice = {
                "potato": 5,
                "NVIDIA GeForce RTX 4090": 70000,
                "NVIDIA GeForce RTX 4080": 60000,
                "NVIDIA GeForce RTX 4070": 50000,
                "NVIDIA GeForce RTX 4060": 40000,
                "NVIDIA GeForce RTX 3090": 55000,
                "NVIDIA GeForce RTX 3080": 45000,
                "NVIDIA GeForce RTX 3070": 35000,
                "NVIDIA GeForce RTX 3060": 25000,
                "NVIDIA GeForce RTX 2080 Ti": 30000,
                "NVIDIA GeForce RTX 2080 Super": 28000,
                "NVIDIA GeForce RTX 2070 Super": 26000,
                "NVIDIA GeForce RTX 2060 Super": 24000,
                "AMD Radeon RX 7900 XTX": 65000,
                "AMD Radeon RX 7900 XT": 60000,
                "AMD Radeon RX 7800 XT": 50000,
                "AMD Radeon RX 7700 XT": 45000,
                "AMD Radeon RX 6900 XT": 55000,
                "AMD Radeon RX 6800 XT": 50000,
                "AMD Radeon RX 6700 XT": 40000,
                "AMD Radeon RX 5700 XT": 35000,
                "AMD Radeon RX 5600 XT": 25000
            };

            const ramPrice = {
                "4GB": 1000,
                "8GB": 2000,
                "12GB": 3000,
                "24GB": 5000,
                "36GB": 7000,
                "64GB": 12000,
                "128GB": 20000
            };

            const storagePrice = {
                "120GB": 1500,
                "240GB": 2500,
                "500GB": 4000,
                "1000GB": 7000,
                "2000GB": 12000,
                "4000GB": 20000
            };

            let totalPrice = 0;

            const selectedProcessor = document.getElementById("processor").value;
            const selectedVGA = document.getElementById("vga").value;

            // Add price for the selected processor
            if (selectedProcessor) {
                totalPrice += processorPrice[selectedProcessor] || 0;
            }

            // Add price for the selected VGA
            if (selectedVGA) {
                totalPrice += vgaPrice[selectedVGA] || 0;
            }

            // Add prices for selected RAM options
            const ramCheckboxes = document.querySelectorAll('input[name="ram"]:checked');
            ramCheckboxes.forEach(checkbox => {
                totalPrice += ramPrice[checkbox.value] || 0;
            });

            // Add prices for selected storage options
            const storageCheckboxes = document.querySelectorAll('input[name="storage"]:checked');
            storageCheckboxes.forEach(checkbox => {
                totalPrice += storagePrice[checkbox.value] || 0;
            });

            // Update the price input field
            document.getElementById("price").value = totalPrice;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Add New Order</h2>
        <form action="AddNewOrderMySQL" method="post">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>Processor:</td>
                    <td>
                        <select id="processor" name="processor" onchange="updatePrice()">
                            <option value="potato">potato</option>
                            <option value="Intel Core i3-13100">Intel Core i3-13100</option>
                            <option value="Intel Core i3-12100">Intel Core i3-12100</option>
                            <option value="Intel Core i3-11100">Intel Core i3-11100</option>
                            <option value="Intel Core i3-10100">Intel Core i3-10100</option>
                            <option value="Intel Core i3-9100">Intel Core i3-9100</option>
                            <option value="Intel Core i3-8100">Intel Core i3-8100</option>
                            <option value="Intel Core i5-13600K">Intel Core i5-13600K</option>
                            <option value="Intel Core i5-12600K">Intel Core i5-12600K</option>
                            <option value="Intel Core i5-11600K">Intel Core i5-11600K</option>
                            <option value="Intel Core i5-10600K">Intel Core i5-10600K</option>
                            <option value="Intel Core i5-9600K">Intel Core i5-9600K</option>
                            <option value="Intel Core i7-13700K">Intel Core i7-13700K</option>
                            <option value="Intel Core i7-12700K">Intel Core i7-12700K</option>
                            <option value="Intel Core i7-11700K">Intel Core i7-11700K</option>
                            <option value="Intel Core i7-11700K">Intel Core i7-11700K</option>
                            <option value="Intel Core i7-10700K">Intel Core i7-10700K</option>
                            <option value="Intel Core i7-9700K">Intel Core i7-9700K</option>
                            <option value="Intel Core i9-13900K">Intel Core i9-13900K</option>
                            <option value="Intel Core i9-12900K">Intel Core i9-12900K</option>
                            <option value="Intel Core i9-11900K">Intel Core i9-11900K</option>
                            <option value="Intel Core i9-10900K">Intel Core i9-10900K</option>
                            <option value="Intel Core i9-9900K">Intel Core i9-9900K</option>
                            <option value="AMD Ryzen 3 7300X">AMD Ryzen 3 7300X</option>
                            <option value="AMD Ryzen 3 7100">AMD Ryzen 3 7100</option>
                            <option value="AMD Ryzen 3 5300G">AMD Ryzen 3 5300G</option>
                            <option value="AMD Ryzen 3 3300X">AMD Ryzen 3 3300X</option>
                            <option value="AMD Ryzen 3 3100">AMD Ryzen 3 3100</option>
                            <option value="AMD Ryzen 5 5600X">AMD Ryzen 5 5600X</option>
                            <option value="AMD Ryzen 5 7600X">AMD Ryzen 5 7600X</option>
                            <option value="AMD Ryzen 5 7600X">AMD Ryzen 5 7600X</option>
                            <option value="AMD Ryzen 7 3800X">AMD Ryzen 7 3800X</option>
                            <option value="AMD Ryzen 7 7800X">AMD Ryzen 7 7800X</option>
                            <option value="AMD Ryzen 7 5800X">AMD Ryzen 7 5800X</option>
                            <option value="AMD Ryzen 9 7950X">AMD Ryzen 9 7950X</option>
                            <option value="AMD Ryzen 9 5950X">AMD Ryzen 9 5950X</option>
                            <option value="AMD Ryzen 9 3950X">AMD Ryzen 9 3950X</option>
                            <option value="AMD Ryzen Threadripper 3990X">AMD Ryzen Threadripper 3990X</option>
                            <option value="AMD Ryzen Threadripper 3970X">AMD Ryzen Threadripper 3970X</option>
                            <option value="AMD Ryzen Threadripper 3960X">AMD Ryzen Threadripper 3960X</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>VGA:</td>
                    <td>
                        <select id="vga" name="vga" onchange="updatePrice()">
                            <option value="potato">potato</option>
                            <option value="AMD Radeon RX 5600 XT">AMD Radeon RX 5600 XT</option>
                            <option value="AMD Radeon RX 5700 XT">AMD Radeon RX 5700 XT</option>
                            <option value="AMD Radeon RX 6700 XT">AMD Radeon RX 6700 XT</option>
                            <option value="AMD Radeon RX 6800 XT">AMD Radeon RX 6800 XT</option>
                            <option value="AMD Radeon RX 6900 XT">AMD Radeon RX 6900 XT</option>
                            <option value="AMD Radeon RX 7700 XT">AMD Radeon RX 7700 XT</option>
                            <option value="AMD Radeon RX 7800 XT">AMD Radeon RX 7900 XT</option>
                            <option value="AMD Radeon RX 7900 XT">AMD Radeon RX 7900 XT</option>
                            <option value="AMD Radeon RX 7900 XTX">AMD Radeon RX 7900 XTX</option>
                            <option value="NVIDIA GeForce RTX 2060 Super">NVIDIA GeForce RTX 2060 Super</option>
                            <option value="NVIDIA GeForce RTX 2070 Super">NVIDIA GeForce RTX 2070 Super</option>
                            <option value="NVIDIA GeForce RTX 3060">NVIDIA GeForce RTX 3060</option>
                            <option value="NVIDIA GeForce RTX 3070">NVIDIA GeForce RTX 3070</option>
                            <option value="NVIDIA GeForce RTX 3080">NVIDIA GeForce RTX 3080</option>
                            <option value="NVIDIA GeForce RTX 3090">NVIDIA GeForce RTX 3090</option>
                            <option value="NVIDIA GeForce RTX 4060">NVIDIA GeForce RTX 4060</option>
                            <option value="NVIDIA GeForce RTX 4070">NVIDIA GeForce RTX 4070</option>
                            <option value="NVIDIA GeForce RTX 4080">NVIDIA GeForce RTX 4080</option>
                            <option value="NVIDIA GeForce RTX 4090">NVIDIA GeForce RTX 4090</option>
                            <option value="NVIDIA GeForce RTX 2080 Super">NVIDIA GeForce RTX 2080 Super</option>
                            <option value="NVIDIA GeForce RTX 2080 Ti">NVIDIA GeForce RTX 2080 Ti</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>RAM:</td>
                    <td>
                        <input type="checkbox" id="ram4gb" name="ram" value="4GB" onclick="updatePrice()">
                        <label for="ram4gb">4GB</label><br>
                        <input type="checkbox" id="ram8gb" name="ram" value="8GB" onclick="updatePrice()">
                        <label for="ram8gb">8GB</label><br>
                        <input type="checkbox" id="ram12gb" name="ram" value="12GB" onclick="updatePrice()">
                        <label for="ram12gb">12GB</label><br>
                        <input type="checkbox" id="ram24gb" name="ram" value="24GB" onclick="updatePrice()">
                        <label for="ram24gb">24GB</label><br>
                        <input type="checkbox" id="ram36gb" name="ram" value="36GB" onclick="updatePrice()">
                        <label for="ram36gb">36GB</label><br>
                        <input type="checkbox" id="ram64gb" name="ram" value="64GB" onclick="updatePrice()">
                        <label for="ram64gb">64GB</label><br>
                        <input type="checkbox" id="ram128gb" name="ram" value="128GB" onclick="updatePrice()">
                        <label for="ram128gb">128GB</label>
                    </td>
                </tr>
                <tr>
                    <td>Storage:</td>
                    <td>
                        <input type="checkbox" id="storage120gb" name="storage" value="120GB" onclick="updatePrice()">
                        <label for="storage120gb">120GB</label><br>
                        <input type="checkbox" id="storage240gb" name="storage" value="240GB" onclick="updatePrice()">
                        <label for="storage240gb">240GB</label><br>
                        <input type="checkbox" id="storage500gb" name="storage" value="500GB" onclick="updatePrice()">
                        <label for="storage500gb">500GB</label><br>
                        <input type="checkbox" id="storage1000gb" name="storage" value="1000GB" onclick="updatePrice()">
                        <label for="storage1000gb">1000GB</label><br>
                        <input type="checkbox" id="storage2000gb" name="storage" value="2000GB" onclick="updatePrice()">
                        <label for="storage2000gb">2000GB</label><br>
                        <input type="checkbox" id="storage4000gb" name="storage" value="4000GB" onclick="updatePrice()">
                        <label for="storage4000gb">4000GB</label>
                    </td>
                </tr>
                <tr>
                    <td>Total Price:</td>
                    <td><input type="text" id="price" name="price" readonly></td>
                </tr>
            </table>
            <input type="submit" value="Submit Order">
        </form>
    </div>
</body>
</html