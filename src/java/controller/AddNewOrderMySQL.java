
package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Order;

public class AddNewOrderMySQL extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Get parameters from the request
        String name = request.getParameter("name"); // Use 'name' parameter
        String processor = request.getParameter("processor");
        String vga = request.getParameter("vga");
        String[] ram = request.getParameterValues("ram");
        String[] storage = request.getParameterValues("storage");

        // Ensure the price parameter is present and parse it
        int price = 0;
        String priceParam = request.getParameter("price");
        if (priceParam != null && !priceParam.isEmpty()) {
            try {
                price = Integer.parseInt(priceParam);
            } catch (NumberFormatException e) {
                System.out.println(">>> Invalid price input: " + priceParam);
                // Handle error: redirect to an error page or set an error attribute
                return;
            }
        }

        // Create an instance of Order
        Order order = new Order();
        order.setName(name);
        order.setProcessor(processor);
        order.setVga(vga);
        order.setRam(ram);
        order.setStorage(storage);
        order.setPrice(price);

        // Insert into MySQL: table orders
        DBConnection dbConnection = new DBConnection();
        if (!dbConnection.insertNewOrder(order)) {
            System.out.println(">>> AddNewOrderMySQL ERROR");
            // Handle insertion error: redirect to an error page or set an error attribute
        } else {
            // Successful insertion: forward to success page
            HttpSession session = request.getSession();
            session.setAttribute("order", order);
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/addNewOrderSuccess.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
