package Uni_Marine_java;

public class User {

    private Integer ownerID;
    private String username;
    private String password;
    private String companyName;

    /**
     * Full constuctor
     *
     * @param ownerID
     * @param username
     * @param password
     * @param companyName
     * 
     */
    public User(Integer ownerID, String username, String password, String companyName) {
        this.ownerID = ownerID;
        this.username = username;
        this.password = password;
        this.companyName = companyName;
    }

    public User(String username, String password, String companyName) {
        this.username = username;
        this.password = password;
        this.companyName = companyName;
    }

    public Integer getOwnerId() {
        return ownerID;
    }

    public void setOwnerId(Integer ownerID) {
        this.ownerID = ownerID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyName() {
        return companyName;
    }

}