package model;

import java.sql.*;
import java.util.ArrayList;

public class MagazzinoDAO {
    public void addMagazzino(Magazzino m){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO magazzino (idMagazzino, nome, indirizzo) VALUES(?,?,?)");
            ps.setLong(1, m.getIdMagazzino());
            ps.setString(2, m.getNome());
            ps.setString(3, m.getIndirizzo());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doChanges(Magazzino m){
        try (Connection con = ConPool.getConnection()) {
            Statement st = con.createStatement();
            String query = "update magazzino set idMagazzino='" + m.getIdMagazzino() + "', nome='" +
                    m.getNome() + "', indirizzo=" + m.getIndirizzo() + " where id=" + m.getIdMagazzino() + ";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public ArrayList<Magazzino> doRetrieveAll(){
        ArrayList<Magazzino> result=new ArrayList<Magazzino>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM magazzino");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Magazzino m = new Magazzino();
                m.setIdMagazzino(rs.getLong(1));
                m.setNome(rs.getString(2));
                m.setIndirizzo(rs.getString(3));
                result.add(m);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Magazzino> doRetrieveByIdCat(long idMagazzino){
        ArrayList<Magazzino> result=new ArrayList<Magazzino>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM magazzino WHERE idMagazzino=?");
            ps.setLong(1,idMagazzino);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Magazzino m = new Magazzino();
                m.setIdMagazzino(rs.getInt(1));
                m.setNome(rs.getString(2));
                m.setIndirizzo(rs.getString(3));
                result.add(m);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
