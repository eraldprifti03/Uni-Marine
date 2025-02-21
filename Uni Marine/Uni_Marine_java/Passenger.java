package Uni_Marine_java;

public class Passenger {

    private Integer passengerId;
    private String firstName;
    private String lastName;
    private Integer age;
    private String ethnicity;
    private Integer imo;
    private Integer routeID;

    /**
     * 
     * Full constuctor*
     * 
     * @param passengerId
     * @param firstName
     * @param lastName
     * @param age
     * @param ethnicity
     * @param imo
     * @param routeID
     * 
     */
    public Passenger(Integer passengerId, String firstName, String lastName, Integer age, String ethnicity, Integer imo,
            Integer routeID) {
        this.passengerId = passengerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.ethnicity = ethnicity;
        this.imo = imo;
        this.routeID = routeID;
    }

    public Passenger(String firstName, String lastName, Integer age, String ethnicity, Integer imo, Integer routeID) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.ethnicity = ethnicity;
        this.imo = imo;
        this.routeID = routeID;

    }

    public Integer getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Integer passengerId) {
        this.passengerId = passengerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getAge() {
        return age;
    }

    public void setEthnicity(String ethnicity) {
        this.ethnicity = ethnicity;
    }

    public String getEthnicity() {
        return ethnicity;
    }

    public void setImo(Integer imo) {
        this.imo = imo;
    }

    public Integer getImo() {
        return imo;
    }

    public void setRouteID(Integer routeID) {
        this.routeID = routeID;
    }

    public Integer getRouteID() {
        return routeID;
    }

}
