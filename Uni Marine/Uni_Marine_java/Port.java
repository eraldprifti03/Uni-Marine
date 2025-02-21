package Uni_Marine_java;


public class Port {
    
    private int id;
    private String name;

    /**
     * Constructor to create a Port.
     * 
     * @param id int the Port id.
     * @param name String the Port name.
     */
    public Port(int id, String name) {
        this.id = id;
        this.name = name;
    }

    /* Getters and Setters */
    
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}