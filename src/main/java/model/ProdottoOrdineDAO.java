package model;

import java.sql.*;
import java.util.ArrayList;

public class ProdottoOrdineDAO {
    public void addProdottoOrdine(Ordine o, Prodotto p,int q){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO prodotto_ordine (ord_fk,pro_fk,quantita) VALUES(?,?,?)");
            ps.setLong(1, o.getIdOrdine());
            ps.setLong(2, p.getIdProdotto());
            ps.setInt(3, q);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doChanges(Prodotto p,Ordine o,int q){
        try (Connection con = ConPool.getConnection()) {
            Statement st = con.createStatement();
            String query = "update prodotto_ordine set quantita=" + q + " where ord_fk=" + o.getIdOrdine() + " and pro_fk="+p.getIdProdotto()+";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<ProdottoOrdine> doRetrieveAll(){
        ArrayList<ProdottoOrdine> result=new ArrayList<ProdottoOrdine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine as po " +
                    "INNER JOIN prodotto as pro ON po.pro_fk = pro.idProdotto " +
                    "INNER JOIN ordine as ord ON po.ord_fk = ord.idOrdine");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ProdottoOrdine po = new ProdottoOrdine();

                Ordine o=new Ordine();
                o.setIva(rs.getDouble("ord.iva"));
                o.setDataInserimento(rs.getDate("ord.dataInserimento"));
                o.setIdOrdine(rs.getInt("ord.idOrdine"));

                Prodotto p=new Prodotto();
                p.setNome(rs.getString("pro.nome"));
                p.setPrezzo(rs.getDouble("pro.prezzo"));
                p.setDescrizioneBreve((rs.getString("pro.descrizioneBreve")));
                p.setDescrizioneDettagliata((rs.getString("pro.descrizioneDettagliata")));
                p.setInOfferta(rs.getBoolean("pro.inOfferta"));
                p.setIdProdotto(rs.getLong("pro.idProdotto"));

                int q=rs.getInt("po.quantita");
                po.setOrdine(o);
                po.setProdotto(p);
                po.setQuantita(q);
                result.add(po);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetriveByIdOrdine(long idOrdine){ // ?????
        ArrayList<Prodotto> result=new ArrayList<Prodotto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine as po " +
                    "INNER JOIN prodotto as pro ON po.pro_fk = pro.idProdotto " +
                    "INNER JOIN ordine as ord ON po.ord_fk = ord.idOrdine where po.ord_fk=?");
            ps.setLong(1, idOrdine);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {


                //??
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Ordine> doRetriveByIdProdotto(long idProdotto){ // ?????
        ArrayList<Ordine> result=new ArrayList<Ordine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine as po " +
                    "INNER JOIN prodotto as pro ON po.pro_fk = pro.idProdotto " +
                    "INNER JOIN ordine as ord ON po.ord_fk = ord.idOrdine where po.ord_fk=?");
            ps.setLong(1, idProdotto);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {


                //??
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
