package Uni_Marine_java;

public class Captain {
    private Integer captID;
    private String username;
    private String password;
    private Integer imo;

    /**
     * Full constuctor
     *
     * @param captID
     * @param username
     * @param password
     * @param imo
     * 
     */
    public Captain(Integer captID, String username, String password, Integer imo) {
        this.captID = captID;
        this.username = username;
        this.password = password;
        this.imo = imo;
    }

    public Captain(String username, String password, Integer imo) {
        this.username = username;
        this.password = password;
        this.imo = imo;
    }

    public Integer getCaptId() {
        return captID;
    }

    public void setCaptId(Integer captID) {
        this.captID = captID;
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

    public void setImo(Integer imo) {
        this.imo = imo;
    }

    public Integer getImo() {
        return imo;
    }
}
