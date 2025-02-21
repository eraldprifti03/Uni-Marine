package Uni_Marine_java;

import java.util.List;
import java.util.ArrayList;
import java.sql.*;


public class PortService {
    
    /**
     * Returns all available Ports.
     * 
     * @return List with the available ports.
     * @throws Exception If any error occurs (not necessary at the moment)
     */
    public List<Port> getPorts() throws Exception {

        List<Port> ports = new ArrayList<Port>();

        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM Port;";

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ports.add( new Port(rs.getInt("PortID"), rs.getString("Name")) );

            }

            rs.close();
            stmt.close();
            db.close();

            return ports;

            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }
       

    }

   
    public Port getPortByID(int portid) throws Exception {


        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM Port WHERE PortID=?;";

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            // setting parameter
            stmt.setInt(1, portid);

            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                rs.close();
                stmt.close();
                db.close();
                throw new Exception("No Port found with id: " + portid);
            }

            Port port = new Port(rs.getInt("PortID"), rs.getString("Name"));
            rs.close();
            stmt.close();
            db.close();

            return port;
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }


	} 

} // End of class