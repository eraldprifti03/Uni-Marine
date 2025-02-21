package Uni_Marine_java;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods related to users.
 *
 * @author
 *
 */
public class UserDAO {

    /**
     * This method returns a List with all Users
     *
     * @return List<User>
     */
    public List<User> getUsers() throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<User> userList = new ArrayList<>();
        try {
            con = db.getConnection();
            String query = "SELECT * FROM owner;";
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("OwnerID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Company_Name"));
                userList.add(user);
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
        return userList;

    }

    /**
     * Search user by username
     *
     * @param username, String
     * @return User, the User object or null
     * @throws Exception
     */
    public User findUser(String username) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = db.getConnection();
            String query = "SELECT * FROM owner WHERE username=?;";
            stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("OwnerID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Company_Name"));
                return user;
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            con.close();
        }
    }

    /**
     * This method is used to authenticate a user.
     *
     * @param username, String
     * @param password, String
     * @return User, the User object
     * @throws Exception, if the credentials are not valid
     */
    public User authenticate(String username, String password) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = db.getConnection();
            String query = "SELECT * FROM owner WHERE Username=? AND Password=?;";
            stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("OwnerID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Company_Name"));
                return user;
            } else {
                throw new Exception("Wrong username or password");
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            con.close();
        }
    }

    /**
     * Register/create new User.
     *
     * @param user, User
     * @throws Exception, if encounter any error.
     */
    public void register(User user) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = db.getConnection();
            String checkQuery = "SELECT * FROM owner WHERE Username=? OR Company_Name=?;";
            stmt = con.prepareStatement(checkQuery);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getCompanyName());
            rs = stmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username or company name already registered");
            } else {
                String insertQuery = "INSERT INTO owner (Username, Password, Company_Name) VALUES (?, ?, ?);";
                stmt = con.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, user.getUsername());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getCompanyName());
                stmt.executeUpdate();

                ResultSet generatedKeys = stmt.getGeneratedKeys();
                int ownerId = 0;
                if (generatedKeys.next()) {
                    ownerId = generatedKeys.getInt(1);
                }

                insertQuery = "INSERT INTO company (OwnerId) VALUES (?);";
                stmt = con.prepareStatement(insertQuery);
                stmt.setInt(1, ownerId);
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
