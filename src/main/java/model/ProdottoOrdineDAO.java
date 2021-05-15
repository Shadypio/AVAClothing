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
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ProdottoOrdine po = new ProdottoOrdine();
                Ordine o=new Ordine();
                Prodotto p=new Prodotto();
                OrdineDAO a=new OrdineDAO();
                ProdottoDAO b=new ProdottoDAO();

                o.setIdOrdine(rs.getLong(1));
                p.setIdProdotto(rs.getLong(2));
                po.setQuantita(rs.getInt(3));

                po.setOrdine(a.doRetrieveById(o.getIdOrdine()));
                po.setProdotto(b.doRetrieveById(p.getIdProdotto()));
                result.add(po);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<ProdottoOrdine> doRetriveByIdOrdine(long id){
        ArrayList<ProdottoOrdine> result=new ArrayList<ProdottoOrdine>();
        OrdineDAO a=new OrdineDAO();
        Ordine o=a.doRetrieveById(id);
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine WHERE ord_fk="+id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ProdottoOrdine po = new ProdottoOrdine();
                po.setOrdine(o);
                Prodotto p=new Prodotto();
                ProdottoDAO b=new ProdottoDAO();
                po.setProdotto(b.doRetrieveById(p.getIdProdotto()));
                po.setQuantita(rs.getInt(3));
                result.add(po);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<ProdottoOrdine> doRetriveByIdProdotto(long id){
        ArrayList<ProdottoOrdine> result=new ArrayList<ProdottoOrdine>();
        ProdottoDAO b=new ProdottoDAO();
        Prodotto p=b.doRetrieveById(id);
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM prodotto_ordine WHERE pro_fk="+id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                ProdottoOrdine po = new ProdottoOrdine();
                po.setProdotto(p);
                OrdineDAO a=new OrdineDAO();
                Ordine o=a.doRetrieveById(id);

                po.setOrdine(a.doRetrieveById(o.getIdOrdine()));
                po.setQuantita(rs.getInt(3));
                result.add(po);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
