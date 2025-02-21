package Uni_Marine_java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

public class CaptainDAO {

    public Captain authenticate(String username, String password) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            String query = "SELECT * FROM captain WHERE Username=? AND Password=?;";
            stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if (rs.next()) {
                Captain captain = new Captain(rs.getInt("CaptID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getInt("IMO"));
                return captain;
            } else {
                throw new Exception("Wrong username or password");
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            con.close();
        }
    }

    public void register(Captain captain) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = db.getConnection();
            String checkQuery = "SELECT * FROM captain WHERE Username=? OR IMO=?;";
            stmt = con.prepareStatement(checkQuery);
            stmt.setString(1, captain.getUsername());
            stmt.setInt(2, captain.getImo());
            rs = stmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username or imo code already registered");
            } else {
                String insertQuery = "INSERT INTO captain (Username,Password, IMO) VALUES (?,?,?);";
                stmt = con.prepareStatement(insertQuery);
                stmt.setString(1, captain.getUsername());
                stmt.setString(2, captain.getPassword());
                stmt.setInt(3, captain.getImo());
                stmt.executeUpdate();
            }
            } catch (SQLIntegrityConstraintViolationException e) {
            // Catch the specific SQL exception for unique constraint violation
            throw new Exception("Sorry, there is already a registered captain for the vessel with the IMO code you entered");
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            con.close();
        }
    }
}
