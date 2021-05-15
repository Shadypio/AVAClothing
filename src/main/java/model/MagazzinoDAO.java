package model;

import java.sql.*;
import java.util.ArrayList;

public class MagazzinoDAO {

    public void addMagazzino(Magazzino m){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO magazzino (idMagazzino, nome, indirizzo) VALUES(?,?,?)");
            ps.setString(1, m.getNome());
            ps.setString(2, m.getIndirizzo());
            ps.setLong(3, m.getIdMagazzino());
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
            String query = "update magazzino set nome='" + m.getNome() + "', indirizzo=" + m.getIndirizzo() + " " +
                    "where idMagazzino=" + m.getIdMagazzino() + ";";
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
                m.setNome(rs.getString(1));
                m.setIndirizzo(rs.getString(2));
                m.setIdMagazzino(rs.getLong(3));
                result.add(m);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Magazzino doRetrieveById(long idMagazzino){
        Magazzino m = new Magazzino();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM magazzino WHERE idMagazzino=?");
            ps.setLong(1,idMagazzino);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                m.setNome(rs.getString(1));
                m.setIndirizzo(rs.getString(2));
                m.setIdMagazzino(rs.getInt(3));
            }
            return m;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
