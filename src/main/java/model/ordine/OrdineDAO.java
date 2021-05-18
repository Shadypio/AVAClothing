package model.ordine;

import model.ConPool;
import model.prodotto.Prodotto;
import model.prodottoordine.ProdottoOrdine;
import model.cliente.Cliente;

import java.sql.*;
import java.util.ArrayList;

public class OrdineDAO {

    public void addOrdine(Ordine p, Cliente c){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO ordine (iva, dataInserimento, idOrdine, cli_fk) VALUES(?,?,?,?)");
            ps.setDouble(1, p.getIva());
            ps.setDate(2, p.getDataInserimento());
            ps.setLong(3, p.getIdOrdine());
            ps.setLong(4, c.getIdCliente());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doChanges(Ordine p){
        try (Connection con = ConPool.getConnection()) {
            Statement st = con.createStatement();
            String query = "update Ordine set iva='" + p.getIva() + "', " + "dataInserimento="+p.getDataInserimento() + " " +
                    "where idOrdine=" + p.getIdOrdine() + ";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Ordine> doRetrieveAll(){
        ArrayList<Ordine> result=new ArrayList<Ordine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM ordine as ord");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine p = new Ordine();
                p.setIva(rs.getDouble("ord.iva"));
                p.setDataInserimento(rs.getDate("ord.dataInserimento"));
                p.setIdOrdine(rs.getInt("ord.idOrdine"));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetrieveById(long id){
        Ordine p = new Ordine();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Ordine as ord WHERE idOrdine=?");
            ps.setLong(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setIva(rs.getDouble("ord.iva"));
                p.setDataInserimento(rs.getDate("ord.dataInserimento"));
                p.setIdOrdine(rs.getInt("ord.idOrdine"));
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetrieveByIdOrdine(long idOrdine, long idCliente){
        Ordine p=new Ordine();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine as po " +
                    "INNER JOIN prodotto as pro ON po.pro_fk = pro.idProdotto " +
                    "INNER JOIN ordine as ord ON po.ord_fk = ord.idOrdine where ord.idOrdine=? and ord.cli_fk=?");
            ps.setLong(1, idOrdine);
            ps.setLong(2, idCliente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setIva(rs.getDouble("ord.iva"));
                p.setDataInserimento(rs.getDate("ord.dataInserimento"));
                p.setIdOrdine(rs.getInt("ord.idOrdine"));
                ArrayList<ProdottoOrdine> prodotti=new ArrayList<>();
                p.setProdotti(prodotti);
                Prodotto a=new Prodotto();
                a.setNome(rs.getString("pro.nome"));
                a.setPrezzo(rs.getDouble("pro.prezzo"));
                a.setDescrizioneBreve((rs.getString("pro.descrizioneBreve")));
                a.setDescrizioneDettagliata((rs.getString("pro.descrizioneDettagliata")));
                a.setInOfferta(rs.getBoolean("pro.inOfferta"));
                a.setIdProdotto(rs.getLong("pro.idProdotto"));
                ProdottoOrdine x=new ProdottoOrdine();
                x.setProdotto(a);
                x.setQuantita(rs.getInt("po.quantita"));
                prodotti.add(x);
                while(rs.next()) {
                    Prodotto b = new Prodotto();
                    b.setNome(rs.getString("pro.nome"));
                    b.setPrezzo(rs.getDouble("pro.prezzo"));
                    b.setDescrizioneBreve((rs.getString("pro.descrizioneBreve")));
                    b.setDescrizioneDettagliata((rs.getString("pro.descrizioneDettagliata")));
                    b.setInOfferta(rs.getBoolean("pro.inOfferta"));
                    b.setIdProdotto(rs.getLong("pro.idProdotto"));
                    ProdottoOrdine y = new ProdottoOrdine();
                    y.setProdotto(b);
                    y.setQuantita(rs.getInt("po.quantita"));
                    prodotti.add(y);
                }
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}



