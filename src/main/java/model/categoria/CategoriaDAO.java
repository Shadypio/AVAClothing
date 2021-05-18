package model.categoria;

import model.ConPool;
import model.categoria.Categoria;

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
            String query = "update Categoria c set c.nome='" + c.getNome() + "', descrizione=" + c.getDescrizione() + " where idCategoria=" + c.getIdCategoria() + ";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Categoria> doRetrieveAll(){
        ArrayList<Categoria> result=new ArrayList<Categoria>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categoria as cat");
            ResultSet rs = ps.executeQuery();
            CategoriaExtractor catExtractor=new CategoriaExtractor();
            while(rs.next()) {
                result.add(catExtractor.extract(rs));
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Categoria doRetrieveById(long idCategoria){
        Categoria c = new Categoria();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categoria as cat WHERE idCategoria=?");
            ps.setLong(1,idCategoria);
            ResultSet rs = ps.executeQuery();
            CategoriaExtractor catExtractor=new CategoriaExtractor();
            if(rs.next()) {
                c.setNome(rs.getString("cat.nome"));
                c.setDescrizione(rs.getString("cat.descrizione"));
                c.setIdCategoria(rs.getLong("cat.idCategoria"));
            }
            return c;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}

