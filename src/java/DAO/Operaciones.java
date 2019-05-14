/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class Operaciones {
  
  String driver;
  String url;
  String uss;
  String contra;
  
  public Operaciones() {
    driver = "com.mysql.jdbc.Driver";
    url = "jdbc:mysql://localhost:3306/CRUD";
    uss = "root";
    contra = "";
  }
  
  public int logear(String us, String pass) {
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    int cont = 0;
    int nivel = 0;
    String sql = "select nivel from login where usuario='" + us + "' and contra='" + pass + "'";
    
    try {
     Class.forName(this.driver);
     conn = (Connection) DriverManager.getConnection(
     this.url,
     this.uss,
     this.contra);
     pst = (PreparedStatement) conn.prepareStatement(sql);
     rs = pst.executeQuery();
     
     while (rs.next()) {
       nivel = rs.getInt(1);
     }
     conn.close();
    } catch (ClassNotFoundException | SQLException e) {
  }
  return nivel;
  }
  
  public int registrar(String us, String pass) {
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    int cont = 0;
    int nivel = 1;
    String sql = "insert into login values('" + us + "','" + pass + "', 1)";
    
    try {
     Class.forName(this.driver);
     conn = (Connection) DriverManager.getConnection(
     this.url,
     this.uss,
     this.contra);
     pst = (PreparedStatement) conn.prepareStatement(sql);
     rs = pst.executeQuery();
     conn.close();
    } catch (ClassNotFoundException | SQLException e) {
    }
    return nivel;
  } 
}
