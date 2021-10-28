/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.product;

import fwallet.data.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pphuh
 */
public class ProductDAO {
    Connection conn=null;
    PreparedStatement stm =null;
    ResultSet rs =null;
    
    public boolean insertNewProduct(ProductDTO product) throws SQLException, ClassNotFoundException{
        boolean check=false;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql ="INSERT INTO tblProduct(productID, categoryID, productName, description, price, quantity, statusID, createDate, image)"
                        + " VALUES(?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getCategoryID());
                stm.setString(3, product.getProductName());
                stm.setString(4, product.getDescription());
                stm.setDouble(5, product.getPrice());
                stm.setInt(6, product.getQuantity());
                stm.setBoolean(7, check);
                stm.setTimestamp(8, product.getCreateDate());
                stm.setString(9, product.getImage());
                check = stm.executeUpdate()>0;
            }
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return check;
    }
    public List<ProductDTO> getAllProduct() throws SQLException{
        List<ProductDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT productID, categoryID, productName, description, price, quantity, statusID, image"
                        +" FROM tblProduct";
                stm = conn.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean statusID = rs.getBoolean("statusID");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, categoryID, productName, description, price, quantity, statusID, image));
                }
            }
        } catch (Exception e) {
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        for(ProductDTO model : list) {
            System.out.println(model.getProductID());
            System.out.println(model.getProductName());
        }
        return list;
    }
    
    public List<ProductDTO> getProductByName(String search) throws SQLException{
        List<ProductDTO> list = new ArrayList<>();
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT productID, productName, price, quantity, statusID, image"
                        + " FROM tblProduct"
                        + " WHERE productName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs=stm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean statusID = rs.getBoolean("statusID");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, price, quantity, statusID, image));
                }
            }
        } catch (Exception e) {
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return list;
    }
    
    public ProductDTO getAProductByID(String ID) throws SQLException{
        ProductDTO product = null;
        try {
            conn = DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT categoryID, productName, description, price, quantity, statusID, image"
                        + " FROM tblProduct"
                        + " WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs=stm.executeQuery();
                while(rs.next()){
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    boolean statusID = rs.getBoolean("statusID");
                    String image = rs.getString("image");
                    product = new ProductDTO(categoryID, productName, description, price, quantity, statusID, image);
                }
            }
        } catch (Exception e) {
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return product;
    }
    
    public boolean removeProduct(String productID) throws SQLException{
        boolean check = false;
        boolean status = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                String sql ="UPDATE tblProduct"
                        + " SET statusID=?"
                        + " WHERE productID=?";
                stm=conn.prepareStatement(sql);
                stm.setBoolean(1, status);
                stm.setString(2, productID);
                check=stm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return check;
    }
    
    public boolean updateProduct(ProductDTO product, String productID) throws SQLException{
        boolean check = false;
        try {
            conn= DBUtil.getConnection();
            if(conn!=null){
                boolean status = false;
                String sql ="UPDATE tblProduct"
                        + " SET productName=?, description=?, price=?, quantity=?, statusID=?"
                        + " WHERE productID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setString(2, product.getDescription());
                stm.setDouble(3, product.getPrice());
                stm.setInt(4, product.getQuantity());
                stm.setBoolean(5, product.isStatusID());
                stm.setString(6, productID);
                check=stm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(conn!=null){
                conn.close();
            }
        }
        return check;
    }
}
