package Uni_Marine_java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Passengers {
    public List<Passenger> getPassengers(String imo) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Passenger> passengerList = new ArrayList<>();
        Integer finalImo;
        try {
            finalImo = Integer.parseInt(imo);
        } catch (NumberFormatException e) {
            finalImo = -1;
        }
        try {
            con = db.getConnection();
            String query = "SELECT * FROM passengers where IMO = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, finalImo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Passenger passenger = new Passenger(rs.getInt("PassengerID"), rs.getString("First_Name"),
                        rs.getString("Last_Name"), rs.getInt("Age"),
                        rs.getString("Ethnicity"), rs.getInt("IMO"), rs.getInt("routeId"));
                passengerList.add(passenger);
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
        return passengerList;

    }

    public void register(Passenger passenger) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        con = db.getConnection();
        String insertQuery = "INSERT INTO passengers (First_Name, Last_Name, Age, Ethnicity, IMO, routeID) VALUES (?, ?, ?, ?, ?, ?);";
        try (PreparedStatement insertStmt = con.prepareStatement(insertQuery)) {
            insertStmt.setString(1, passenger.getFirstName());
            insertStmt.setString(2, passenger.getLastName());
            insertStmt.setInt(3, passenger.getAge());
            insertStmt.setString(4, passenger.getEthnicity());
            insertStmt.setInt(5, passenger.getImo());
            insertStmt.setInt(6, passenger.getRouteID());

            insertStmt.executeUpdate();

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