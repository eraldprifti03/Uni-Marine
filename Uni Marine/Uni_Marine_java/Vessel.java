package Uni_Marine_java;

public class Vessel {
    private Integer imo;
    private String name;
    private Integer crewSize;
    private String flag;
    private Integer capacity;
    private Integer compId;

    /**
     * Full constuctor
     *
     * @param ownerID
     * @param username
     * @param password
     * @param companyName
     * 
     */
    public Vessel(Integer imo, String name, Integer crewSize, String flag, Integer capacity, Integer compId) {
        this.imo = imo;
        this.name = name;
        this.crewSize = crewSize;
        this.flag = flag;
        this.capacity = capacity;
        this.compId = compId;
    }

    public Vessel(Integer imo, String name, Integer crewSize, String flag, Integer capacity) {
        this.imo = imo;
        this.name = name;
        this.crewSize = crewSize;
        this.flag = flag;
        this.capacity = capacity;
    }

    public Integer getImo() {
        return imo;
    }

    public void setImo(Integer imo) {
        this.imo = imo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCrewSize() {
        return crewSize;
    }

    public void setCrewsize(Integer crewSize) {
        this.crewSize = crewSize;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getFlag() {
        return flag;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCompId(Integer compId) {
        this.compId = compId;
    }

    public Integer getCompId() {
        return compId;
    }

}
