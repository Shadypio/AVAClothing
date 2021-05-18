package model.prodotto;

import model.ConPool;
import model.categoria.Categoria;
import model.magazzino.Magazzino;
import model.prodotto.Prodotto;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
//AGGIUNGI STRINGA IMMAGINE
public class ProdottoDAO {
    public Prodotto doRetrieveById(long id) {
        Prodotto p;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto as pro WHERE idProdotto=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            ProdottoExtractor proExtractor = new ProdottoExtractor();
            if (rs.next()) {
                p = proExtractor.extract(rs);
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
            PreparedStatement s = con.prepareStatement("SELECT * FROM prodotto as pro");
            ResultSet rs = s.executeQuery();
            ProdottoExtractor proExtractor = new ProdottoExtractor() ;
            while(rs.next()){
                prodotti.add(proExtractor.extract(rs));
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

    public void addProdotto(Prodotto prodotto, Categoria categoria, Magazzino magazzino) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotto (nome, prezzo, descrizioneBreve, descrizioneDettagliata, inOfferta, idProdotto,mag_fk,cat_fk) VALUES(?,?,?,?,?,?,?,?)");
            ps.setString(1, prodotto.getNome());
            ps.setDouble(2, prodotto.getPrezzo());
            ps.setString(3, prodotto.getDescrizioneBreve());
            ps.setString(4, prodotto.getDescrizioneDettagliata());
            ps.setBoolean(5, prodotto.isInOfferta());
            ps.setLong(6, prodotto.getIdProdotto());
            ps.setLong(7,magazzino.getIdMagazzino());
            ps.setLong(8,categoria.getIdCategoria());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetrieveProdottiWithCategoria(long id){
        ArrayList<Prodotto> prodotti = new ArrayList<>();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM prodotto as pro INNER JOIN categoria ON pro.cat_fk = categoria.idCategoria WHERE categoria.idCategoria = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ProdottoExtractor proExtractor = new ProdottoExtractor();
            while( rs.next()) {
                Prodotto p;
                p = proExtractor.extract(rs);
                prodotti.add(p);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return prodotti;
    }
}
