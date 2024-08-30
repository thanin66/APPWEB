package model;

/**
 *
 * @author 07
 */
public class Order {
    private String name;
    private String processor;
    private String vga; 
    private String[] ram; 
    private String[] storage; 
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

    public void setRam(String[] ram) {
        this.ram = ram;
    }

    public void setStorage(String[] storage) { 
        this.storage = storage;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
