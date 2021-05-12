package model;

import java.sql.*;
import java.util.ArrayList;

public class CategoriaDAO {
    public void addCategoria(Categoria c){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO categoria (nome, descrizione, idCategoria) VALUES(?,?,?)");
            ps.setString(1, c.getNome());
            ps.setString(2, c.getDescrizione());
            ps.setLong(3, c.getIdCategoria());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doChanges(Categoria c){
        try (Connection con = ConPool.getConnection()) {
            Statement st = con.createStatement();
            /*String query = "update Prodotto set idCategoria='" + c.getIdCategoria() + "', nome='" +
                    c.getNome() + "', descrizione=" + c.getDescrizione() + " where idCategoria=" + c.getIdCategoria() + ";";
            st.executeUpdate(query);*/ // Si può cambiare l'ID?
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public ArrayList<Categoria> doRetrieveAll(){
        ArrayList<Categoria> result=new ArrayList<Categoria>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categoria");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Categoria c = new Categoria();
                c.setNome(rs.getString(1));
                c.setDescrizione(rs.getString(2));
                c.setIdCategoria(rs.getLong(3));
                result.add(c);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Categoria> doRetrieveById(long idCategoria){
        ArrayList<Categoria> result=new ArrayList<Categoria>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categoria WHERE idCategoria=?");
            ps.setLong(1,idCategoria);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Categoria c = new Categoria();
                c.setNome(rs.getString(1));
                c.setDescrizione(rs.getString(2));
                c.setIdCategoria(rs.getLong(3));
                result.add(c);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}

