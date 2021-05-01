package model;

import java.sql.*;
import java.util.ArrayList;

public class CategoriaDAO {
    public void addCategoria(Categoria c){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO categoria (idCategoria, nome, descrizione, prezzo,idCat) VALUES(?,?,?)");
            ps.setLong(1, c.getIdCategoria());
            ps.setString(2, c.getNome());
            ps.setString(3, c.getDescrizione());
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
            String query = "update Prodotto set id='" + c.getIdCategoria() + "', nome='" +
                    c.getNome() + "', descrizione=" + c.getDescrizione() + " where id=" + c.getIdCategoria() + ";";
            st.executeUpdate(query);
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
                c.setIdCategoria(rs.getLong(1));
                c.setNome(rs.getString(2));
                c.setDescrizione(rs.getString(3));
                result.add(c);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Categoria> doRetrieveByIdCat(long idCategoria){
        ArrayList<Categoria> result=new ArrayList<Categoria>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categoria WHERE idCategoria=?");
            ps.setLong(1,idCategoria);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt(1));
                c.setNome(rs.getString(2));
                c.setDescrizione(rs.getString(3));
                result.add(c);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}

