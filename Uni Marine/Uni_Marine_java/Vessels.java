package Uni_Marine_java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Vessels {
    public List<Vessel> getVessels(String searchTerm) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Vessel> vesselList = new ArrayList<>();
        try {
            con = db.getConnection();
            String query = "SELECT * FROM vessel " +
                    "LEFT JOIN owner ON owner.Company_Name = ? " +
                    "LEFT JOIN company ON company.OwnerID = owner.OwnerID " +
                    "WHERE vessel.CompID = company.CompID";

            stmt = con.prepareStatement(query);
            stmt.setString(1, searchTerm);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Vessel vessel = new Vessel(rs.getInt("IMO"), rs.getString("Name"), rs.getInt("CrewSize"),
                        rs.getString("Flag"), rs.getInt("Capacity"), rs.getInt("CompID"));
                vesselList.add(vessel);
            }

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                }
            }
        }
        return vesselList;

    }

    public void register(Vessel vessel, String companyName) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = db.getConnection();

            String checkQuery = "SELECT * FROM vessel WHERE IMO=?;";
            try (PreparedStatement checkStmt = con.prepareStatement(checkQuery)) {
                checkStmt.setInt(1, vessel.getImo());
                try (ResultSet checkRs = checkStmt.executeQuery()) {
                    if (checkRs.next()) {
                        throw new Exception("Sorry, IMO code already registered");
                    }
                }
            }

            String query = "SELECT * FROM company " +
                    "LEFT JOIN owner ON owner.OwnerID = company.OwnerID " +
                    "WHERE owner.Company_Name = ?";

            try (PreparedStatement compIdStmt = con.prepareStatement(query)) {
                compIdStmt.setString(1, companyName);
                try (ResultSet compIdRs = compIdStmt.executeQuery()) {
                    if (compIdRs.next()) {
                        int compid = compIdRs.getInt("CompID");

                        String insertQuery = "INSERT INTO vessel (IMO, Name, Crewsize, Flag, Capacity, CompID) VALUES (?, ?, ?, ?, ?, ?);";
                        try (PreparedStatement insertStmt = con.prepareStatement(insertQuery)) {
                            insertStmt.setInt(1, vessel.getImo());
                            insertStmt.setString(2, vessel.getName());
                            insertStmt.setInt(3, vessel.getCrewSize());
                            insertStmt.setString(4, vessel.getFlag());
                            insertStmt.setInt(5, vessel.getCapacity());
                            insertStmt.setInt(6, compid);

                            insertStmt.executeUpdate();
                        }
                    } else {
                        throw new Exception("The given company name does not exist!");
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception("Failed to register vessel: " + e.getMessage(), e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
            }
        }
    }
}
