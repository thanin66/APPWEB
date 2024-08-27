import controller.DBConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;

public class AddNewOrderMySQL extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Get parameters from the request
        String name = request.getParameter("foodName");
        String processor = request.getParameter("processor");
        String vga = request.getParameter("vga");
        String[] ram = request.getParameterValues("ram");
        String[] storage = request.getParameterValues("storage");
        int price = Integer.parseInt(request.getParameter("price"));

        // Create an instance of Order
        Order order = new Order();
        order.setName(name);
        order.setProcessor(processor);
        order.setVga(vga); // Correct method name
        order.setRam(ram); // Correct method name
        order.setStorage(storage); // Ensure this method exists
        order.setPrice(price);

        // Insert into MySQL: table orders
        DBConnection dbConnection = new DBConnection();
        if (!dbConnection.insertNewOrder(order)) {
            System.out.println(">>> AddNewOrderMySQL ERROR");
        }

        // Forward to success page
        HttpSession session = request.getSession();
        session.setAttribute("order", order);
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/addNewOrderSuccess.jsp");
        rd.forward(request, response);
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
