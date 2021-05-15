package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;

public class ProdottoDAO {
    public Prodotto doRetrieveById(long id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto WHERE idProdotto=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Prodotto p = new Prodotto();
                p.setNome(rs.getString(1));
                p.setPrezzo(rs.getDouble(2));
                p.setDescrizioneBreve((rs.getString(3)));
                p.setDescrizioneDettagliata((rs.getString(4)));
                p.setInOfferta(rs.getBoolean(5));
                p.setIdProdotto(rs.getLong(6));
                return p;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public LinkedList<Prodotto> doRetrieveAll(){
        LinkedList<Prodotto> prodotti = new LinkedList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement s = con.prepareStatement("SELECT * FROM prodotto");
            ResultSet rs = s.executeQuery();
            while(rs.next()){
                Prodotto p = new Prodotto();
                p.setNome(rs.getString(1));
                p.setPrezzo(rs.getDouble(2));
                p.setDescrizioneBreve((rs.getString(3)));
                p.setDescrizioneDettagliata((rs.getString(4)));
                p.setInOfferta(rs.getBoolean(5));
                p.setIdProdotto(rs.getLong(6));
                prodotti.add(p);
            }
            return prodotti;
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public boolean doChanges(Prodotto prodotto){
        try(Connection con = ConPool.getConnection()){
            long idProdotto = prodotto.getIdProdotto();
            String nome = prodotto.getNome();
            double prezzo = prodotto.getPrezzo();
            boolean inOfferta = prodotto.isInOfferta();
            String descrizioneBreve = prodotto.getDescrizioneBreve();
            String descrizioneDettagliata = prodotto.getDescrizioneDettagliata();
            String query = "UPDATE prodotto p SET p.nome = '" + nome + "', p.prezzo = " + prezzo +
                    ", p.inofferta = " + inOfferta + ", p.descrizioneBreve = '" + descrizioneBreve + "'," +
                    "p.descrizioneDettagliata = '" + descrizioneDettagliata + "', WHERE p.IdProdotto = " + idProdotto + ";";
            PreparedStatement s = con.prepareStatement(query);
            s.execute();
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public void addProdotto(Prodotto prodotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotto (nome, prezzo, descrizioneBreve, descrizioneDettagliata, inOfferta, idProdotto) VALUES(?,?,?,?,?,?)");
            ps.setString(1, prodotto.getNome());
            ps.setDouble(2, prodotto.getPrezzo());
            ps.setString(3, prodotto.getDescrizioneBreve());
            ps.setString(4, prodotto.getDescrizioneDettagliata());
            ps.setBoolean(5, prodotto.isInOfferta());
            ps.setLong(6, prodotto.getIdProdotto());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetrieveProdottiDiCategoria(long id){
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM prodotto INNER JOIN categoria ON prodotto.cat_fk = categoria.idCategoria WHERE categoria.idCategoria = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Prodotto p = new Prodotto();
                p.setNome(rs.getString(1));
                p.setPrezzo(rs.getDouble(2));
                p.setDescrizioneBreve((rs.getString(3)));
                p.setDescrizioneDettagliata((rs.getString(4)));
                p.setInOfferta(rs.getBoolean(5));
                p.setIdProdotto(rs.getLong(6));
                prodotti.add(p);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return prodotti;
    }

    public ArrayList<Prodotto> doRetrieveSpedizioneWithOrdine(long id){
        ArrayList<Prodotto> prodotti = new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM prodotto INNER JOIN categoria ON prodotto.cat_fk = categoria.idCategoria WHERE categoria.idCategoria = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Prodotto p = new Prodotto();
                p.setNome(rs.getString(1));
                p.setPrezzo(rs.getDouble(2));
                p.setDescrizioneBreve((rs.getString(3)));
                p.setDescrizioneDettagliata((rs.getString(4)));
                p.setInOfferta(rs.getBoolean(5));
                p.setIdProdotto(rs.getLong(6));
                prodotti.add(p);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return prodotti;
    }
}
