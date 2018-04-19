/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.bean.Admin;
import com.bean.Product;
import com.bean.Seller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class DatabaseHelper {

    public static void main(String[] args) {
        System.out.println(""+DatabaseHelper.getNumberApprovedSeller());
         System.out.println(""+DatabaseHelper.getNumberApprovedProduct());
    }

    public static Connection getConnection() {

        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bechakena", "root", "root");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        return connection;
    }

    public static int insertProduct(Product product) {
        int insert = 0;
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement("insert into productpending(title, catagory, quentity, price, phone, details) values(?,?,?,?,?,?)");
            statement.setString(1, product.getTitle());
            statement.setString(2, product.getCatagory());
            statement.setInt(3, product.getQuantity());
            statement.setFloat(4, product.getPrice());
            statement.setString(5, product.getPhone());
            statement.setString(6, product.getDetails());
            insert = statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return insert;
    }
    
    
     public static int productAddToProductinfo (Product product) {
        int insert = 0;
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement("insert into productinfo(title, catagory, quentity, price, phone, details) values(?,?,?,?,?,?)");
            statement.setString(1, product.getTitle());
            statement.setString(2, product.getCatagory());
            statement.setInt(3, product.getQuantity());
            statement.setFloat(4, product.getPrice());
            statement.setString(5, product.getPhone());
            statement.setString(6, product.getDetails());
            insert = statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return insert;
    }

//==============================Method of Account Creation===================================
    public static int adminAccount(Admin admin) {
        int status = 0;
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("insert into adminTable(name, user_name, password) values(?,?,?)");
            statement.setString(1, admin.getName());

            statement.setString(2, admin.getUsername());
            statement.setString(3, admin.getPassword());
            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
        return status;
    }

    public static boolean adminLogin(String userName, String password) {
        boolean status = false;
        Connection connection = getConnection();
        PreparedStatement pst;
        
    

        try {
            pst = connection.prepareStatement("Select userName,password from admin where userName=? and password=?");

            pst.setString(1, userName);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                status = true;
                System.out.println("Valid login credentials");
            } else {
                System.out.println("Invalid login credentials");
            }

        } catch (Exception ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }

    public static int sellerRegister(Seller seller) {
        int status = 0;

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("insert into selleraccountpanding(name, phoneNumber, email, dateofBirth, gender, password, division, distric, subDistric, postOffice, village, occupation) values(?,?,?,?,?,?,?,?,?,?,?,?)");
            statement.setString(1, seller.getName());
            statement.setString(2, seller.getPhone());
            statement.setString(3, seller.getEmail());
            statement.setString(4, seller.getBdate());
            statement.setString(5, seller.getGender());
            statement.setString(6, seller.getPassword());
            statement.setString(7, seller.getDivision());
            statement.setString(8, seller.getDistric());
            statement.setString(9, seller.getSubdis());
            statement.setString(10, seller.getPostoffice());
            statement.setString(11, seller.getVillage());
            statement.setString(12, seller.getOccupation());
            status = statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("com.dao.DatabaseHelper.sellerRegister()" + ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }
    
    public static Seller getSellerById(int id, String tableName) {
        Seller seller = new Seller();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from "+tableName+" where id=?");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                
                seller.setId(rs.getInt("id"));
                seller.setName(rs.getString("name"));
                seller.setPhone(rs.getString("phoneNumber"));
                seller.setEmail(rs.getString("email"));
                seller.setGender(rs.getString("gender"));
                seller.setPassword(rs.getString("password"));
                seller.setDivision(rs.getString("division"));
                seller.setDistric(rs.getString("distric"));
                seller.setSubdis(rs.getString("subDistric"));
                seller.setPostoffice(rs.getString("postOffice"));
                seller.setVillage(rs.getString("village"));
                seller.setOccupation(rs.getString("occupation"));
                

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return seller;
    }
    
    public static int sellerAddToSellerDatabase(Seller seller) {
        int status = 0;

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("insert into selleraccount(name, phoneNumber, email, dateofBirth, gender, password, division, distric, subDistric, postOffice, village, occupation) values(?,?,?,?,?,?,?,?,?,?,?,?)");
            statement.setString(1, seller.getName());
            statement.setString(2, seller.getPhone());
            statement.setString(3, seller.getEmail());
            statement.setString(4, seller.getBdate());
            statement.setString(5, seller.getGender());
            statement.setString(6, seller.getPassword());
            statement.setString(7, seller.getDivision());
            statement.setString(8, seller.getDistric());
            statement.setString(9, seller.getSubdis());
            statement.setString(10, seller.getPostoffice());
            statement.setString(11, seller.getVillage());
            statement.setString(12, seller.getOccupation());
            status = statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("com.dao.DatabaseHelper.sellerRegister()" + ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }
    
    

    public static int sellerLogin(String phoneNumber, String password) {
        int status = 0;
        Connection connection = getConnection();
        PreparedStatement pst;

        try {

            pst = connection.prepareStatement("Select phoneNumber,password from selleraccount where phoneNumber=? and password=?");

            pst.setString(1, phoneNumber);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                status = 1;
                System.out.println("Valid login credentials");
            } else {
                System.out.println("Invalid login credentials");
            }

        } catch (Exception ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }

//==============================Method of search Product========================================
    public static ArrayList<Product> searchByClue(String category, float price, String phone) {
        ArrayList<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        if (category != null && phone != null) {

        }

        return products;
    }
    //TODO

    public static ArrayList<Product> searchProductOfAUser(String phoneNumber) {
        ArrayList<Product> products = new ArrayList<>();

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareCall("select * from productinfo where phone=?");
            statement.setString(1, phoneNumber);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return products;
    }
public static ArrayList<Product> searchPendingProductOfAUser(String phoneNumber) {
        ArrayList<Product> products = new ArrayList<>();

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareCall("select * from productpending where phone=?");
            statement.setString(1, phoneNumber);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return products;
    }

    public static ArrayList<Product> productSearch(String string) {
        ArrayList<Product> products = new ArrayList<>();
        Connection connection = getConnection();

        try {
            PreparedStatement statement = connection.prepareStatement("select * from productInfo where title like \"%" + string + "%\"");

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return products;
    }

//==============================Method Of get All Product. For Admin=====================================
    public static List<Product> getAllProduct(String selectedShort) {
        List<Product> products = new ArrayList<>();

        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from productInfo ORDER BY "+selectedShort);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));

                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));

                products.add(product);

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }

        return products;

    }

    public static ArrayList<Product> getAllPendingProduct() {
        ArrayList<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from productpending order by id desc");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));

                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));

                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return products;
    }

    public static ArrayList<Seller> getAllSeller() {
        ArrayList<Seller> sellers = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from selleraccount order by name");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Seller seller = new Seller();
                seller.setId(rs.getInt("id"));
                seller.setName(rs.getString("name"));
                seller.setPhone(rs.getString("phoneNumber"));
                seller.setEmail(rs.getString("email"));
                seller.setGender(rs.getString("gender"));
                seller.setPassword(rs.getString("password"));
                seller.setDivision(rs.getString("division"));
                seller.setDistric(rs.getString("distric"));
                seller.setSubdis(rs.getString("subDistric"));
                seller.setPostoffice(rs.getString("postOffice"));
                seller.setVillage(rs.getString("village"));
                seller.setOccupation(rs.getString("occupation"));
                sellers.add(seller);

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return sellers;
    }

    public static ArrayList<Seller> getAllPendingSeller() {
        ArrayList<Seller> sellers = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from selleraccountpanding");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Seller seller = new Seller();
                seller.setId(rs.getInt("id"));
                seller.setName(rs.getString("name"));
                seller.setPhone(rs.getString("phoneNumber"));
                seller.setEmail(rs.getString("email"));
                seller.setGender(rs.getString("gender"));
                seller.setPassword(rs.getString("password"));
                seller.setDivision(rs.getString("division"));
                seller.setDistric(rs.getString("distric"));
                seller.setSubdis(rs.getString("subDistric"));
                seller.setPostoffice(rs.getString("postOffice"));
                seller.setVillage(rs.getString("village"));
                seller.setOccupation(rs.getString("occupation"));
                sellers.add(seller);

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return sellers;
    }

//===============================
    public static Product getProducById(int id) {
        Product product = new Product();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from productinfo where id=?");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }

        return product;
    }

     public static Product getPendingProducById(int id) {
        Product product = new Product();
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from productpending where id=?");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCatagory(rs.getString("catagory"));
                product.setQuantity(rs.getInt("quentity"));
                product.setPrice(rs.getFloat("price"));
                product.setPhone(rs.getString("phone"));
                product.setDetails(rs.getString("details"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }

        return product;
    }

    
    public static int deleteProduct(Product u, String talbeName) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from " + talbeName + " where id=?");
            ps.setInt(1, u.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public static int deleteSeller(Seller s, String talbeName) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("delete from " + talbeName + " where id=?");
            ps.setInt(1, s.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public static int updatePandingPost(Product product){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update productpending set title=?, catagory=?, quentity=?, phone=?, price=?, details=? where id=?");
		ps.setString(1,product.getTitle());
		ps.setString(2,product.getCatagory());
		ps.setInt(3,product.getQuantity());
		ps.setString(4,product.getPhone());
		ps.setFloat(5,product.getPrice());
		ps.setString(6,product.getDetails());
                ps.setInt(7,product.getId());
		status=ps.executeUpdate();
	}catch(Exception e){
            System.out.println(e);
        }
	return status;
}
    public static Seller getSellerByPhoneNumber(String phoneNumber){
        Seller seller=new Seller();
        Connection connection=getConnection();
        try {
            PreparedStatement statement=connection.prepareStatement("select * from selleraccount where phoneNumber="+phoneNumber);
            ResultSet rs=statement.executeQuery();
            while (rs.next()) {                
               seller.setId(rs.getInt("id"));
                seller.setName(rs.getString("name"));
                seller.setPhone(rs.getString("phoneNumber"));
                seller.setEmail(rs.getString("email"));
                seller.setGender(rs.getString("gender"));
                seller.setPassword(rs.getString("password"));
                seller.setDivision(rs.getString("division"));
                seller.setDistric(rs.getString("distric"));
                seller.setSubdis(rs.getString("subDistric"));
                seller.setPostoffice(rs.getString("postOffice"));
                seller.setVillage(rs.getString("village"));
                seller.setOccupation(rs.getString("occupation"));
            }
            
                    
                    
                    
                    } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return seller;
    } 
    public static int getNumberApprovedSeller(){
        int count=0;
    Connection connection=getConnection();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT COUNT(*) FROM selleraccount");
            ResultSet rs=statement.executeQuery();
            while (rs.next()) {                
                count=rs.getInt("count(*)");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if (connection!=null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    return count;
    }
     public static int getNumberApprovedProduct(){
        int count=0;
    Connection connection=getConnection();
        try {
            PreparedStatement statement=connection.prepareStatement("SELECT COUNT(*) FROM productinfo");
            ResultSet rs=statement.executeQuery();
            while (rs.next()) {                
                count=rs.getInt("count(*)");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            if (connection!=null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    return count;
    }
}
