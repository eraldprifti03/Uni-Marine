package Uni_Marine_java;

import java.sql.*;

public class Route {

public String getEstTime(int from,int to) throws Exception {
        if(from==to){
            String time="00:00:00";
            return time;
        }

    DB db = new DB();
    Connection con = null;
    String query = "SELECT Estimated_time  FROM route where Beginning=? and Destination=? ;";

    try {

        con = db.getConnection();
        PreparedStatement stmt = con.prepareStatement(query);

        // setting parameter
        stmt.setInt(1, from);
        stmt.setInt(2, to);

        ResultSet rs = stmt.executeQuery();

        
        if (rs.next()) {
        Time estimatedTime = rs.getTime("Estimated_time");
        rs.close();
        stmt.close();
        db.close();
        String estimatedTimeString = estimatedTime.toString();
        return estimatedTimeString;
        } else {


        // setting parameter
        stmt.setInt(1, to);
        stmt.setInt(2, from);

        rs = stmt.executeQuery();

        
        if (rs.next()) {
        Time estimatedTime = rs.getTime("Estimated_time");
        rs.close();
        stmt.close();
        db.close();
        String estimatedTimeString = estimatedTime.toString();
        return estimatedTimeString;
        }
        return "";
    }
            
        

 } catch (Exception e) {
    throw new Exception(e.getMessage());
} finally {
    try {
        db.close();
    } catch (Exception e) {
        
    }
}

} 
}
