package model;

import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO {
    public ArrayList<Cliente> doRetrieveAll(){
        ArrayList<Cliente> result=new ArrayList<Cliente>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Cliente p = new Cliente();
                p.setUsername(rs.getString(1));
                p.setPassword(rs.getString(2));
                p.setEmail(rs.getString(3));
                p.setNome(rs.getString(4));
                p.setCognome(rs.getString(5));
                p.setIndirizzo(rs.getString(6));
                p.setIdCliente(rs.getLong(7));
                p.setRegistrato(rs.getBoolean(8));
                p.setOrdini((ArrayList<Ordine>) rs.getArray(9));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean doRetrieveByUserPass(String us,String pas){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM utente WHERE username=? and password=SHA1(?)");
            ps.setString(1,us);
            ps.setString(2,pas);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                return true;
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addCliente(Cliente p){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO cliente (username, password, email, nome, cognome,indirizzo, id, isRegistrato, Ordini) VALUES(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, p.getUsername());
            ps.setString(2, p.getPassword());
            ps.setString(3, p.getEmail());
            ps.setString(4,p.getNome());
            ps.setString(5,p.getCognome());
            ps.setString(6,p.getIndirizzo());
            ps.setLong(7,p.getIdCliente());
            ps.setBoolean(8,p.isRegistrato());
            ps.setArray(9, (Array) p.getOrdini());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
