package model;

import java.sql.*;
import java.util.LinkedList;

/**
 *
 * GESTIRE LE FOREIGN KEY PER OGNI METODO
 */

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
                p.setIdProdotto(rs.getLong(1));
                p.setNome(rs.getString(2));
                p.setPrezzo(rs.getDouble(3));
                p.setInOfferta(rs.getBoolean(4));
                p.setDescrizioneBreve((rs.getString(5)));
                p.setDescrizioneDettagliata((rs.getString(6)));
                prodotti.add(p);
            }
            return prodotti;
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    // da' errori, commentato per evitare problemi nel commmit
    /*public boolean doChanges(Prodotto prodotto){
        try(Connection con = ConPool.getConnection()){
            long idProdotto = prodotto.getIdProdotto();
            String nome = prodotto.getNome();
            double prezzo = prodotto.getPrezzo();
            boolean inOfferta = prodotto.isInOfferta();
            String descrizioneBreve = prodotto.getDescrizioneBreve();
            String descrizioneDettagliata = prodotto.getDescrizioneDettagliata();
            String query = "UPDATE prodotto p SET p.nome = \"" + nome + "\", p.prezzo = " + prezzo +
                    "\", p.inofferta = " + inOfferta + ", p.descrizioneBreve = \"" + descrizioneBreve + "\", " +
                    "p.descrizionDettagliata = \"" + descrizioneDettagliata + "\" WHERE p.IdProdotto = " + idProdotto + "";
            PreparedStatement s = con.prepareStatement(query);
            s.execute();
            return true;
        } catch(SQLException e){
            return false;
        }
    }*/

    public void addProdotto(Prodotto prodotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotto (nome, prezzo, descrizioneBreve, descrizioneDettagliata, inOfferta, idProdotto) VALUES(?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, prodotto.getNome());
            ps.setDouble(2, prodotto.getPrezzo());
            ps.setString(3, prodotto.getDescrizioneBreve());
            ps.setString(4, prodotto.getDescrizioneDettagliata());
            ps.setBoolean(5, prodotto.isInOfferta());
            ps.setLong(6, prodotto.getIdProdotto());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            long id = rs.getLong(1);
            prodotto.setIdProdotto(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
