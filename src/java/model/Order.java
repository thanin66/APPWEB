package model;

/**
 *
 * @author 07
 */
public class Order {
    private String name;
    private String processor;
    private String vga; // Changed from 'VGA' to 'vga' for consistency
    private String[] ram; // Changed to String array if multiple RAM values are expected
    private String[] storage; // Changed to String array if multiple storage values are expected
    private int price;

    // Getters
    public String getName() {
        return name;
    }

    public String getProcessor() {
        return processor;
    }

    public String getVga() {
        return vga;
    }

    public String[] getRam() {
        return ram; // Changed to return String array
    }

    public String[] getStorage() {
        return storage; // Changed to return String array
    }

    public int getPrice() {
        return price;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public void setVga(String vga) {
        this.vga = vga;
    }

    public void setRam(String[] ram) { // Changed to accept String array
        this.ram = ram;
    }

    public void setStorage(String[] storage) { // Changed to accept String array
        this.storage = storage;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setVGA(String vga) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setRAM(String[] ram) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
