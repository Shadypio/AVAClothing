package model.spedizione;

import model.ConPool;
import model.ordine.Ordine;
import model.spedizione.Spedizione;

import java.sql.*;
import java.util.LinkedList;

/**
 */

public class SpedizioneDAO {

    public Spedizione doRetrieveById(long id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM spedizione as spe WHERE idSpedizione=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Spedizione p = new Spedizione();
                p.setData(rs.getDate("spe.data"));
                p.setStatus(rs.getString("spe.status"));
                p.setSpese(rs.getDouble("spe.spese"));
                p.setIdSpedizione(rs.getLong("spe.idSpedizione"));
                return p;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public LinkedList<Spedizione> doRetrieveAll(){
        LinkedList<Spedizione> spedizioni = new LinkedList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement s = con.prepareStatement("SELECT * FROM spedizione as spe");
            ResultSet rs = s.executeQuery();
            while(rs.next()){
                Spedizione p = new Spedizione();
                p.setData(rs.getDate("spe.data"));
                p.setStatus(rs.getString("spe.status"));
                p.setSpese(rs.getDouble("spe.spese"));
                p.setIdSpedizione(rs.getLong("spe.idSpedizione"));
                spedizioni.add(p);
            }
            return spedizioni;
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public boolean doChanges(Spedizione spedizione){
        try(Connection con = ConPool.getConnection()){
            long idSpedizione = spedizione.getIdSpedizione();
            Date data = (Date) spedizione.getData();
            String status = spedizione.getStatus();
            double spese = spedizione.getSpese();
            String query = "UPDATE spedizione s SET s.dataSpedizione = '" + data + "', s.statusSpedizione = '" + status + "', " +
                    "s.spese = " + spese + " WHERE s.idSpedizione = " + idSpedizione + ";";
            PreparedStatement s = con.prepareStatement(query);
            s.execute();
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public void addSpedizione(Spedizione spedizione, Ordine ordine) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO spedizione (dataSpedizione, statusSpedizione, spese, idSpedizione,ord_fk) VALUES(?,?,?,?,?)");
            ps.setDate(1, (Date) spedizione.getData());
            ps.setString(2, spedizione.getStatus());
            ps.setDouble(3, spedizione.getSpese());
            ps.setLong(4, spedizione.getIdSpedizione());
            ps.setLong(5,ordine.getIdOrdine());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Spedizione doRetrieveSpedizioneWithOrdine(long id){
        Spedizione p = new Spedizione();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM spedizione as spe INNER JOIN ordine as ord ON spe.ord_fk = ord.idOrdine WHERE ord.idOrdine = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setData(rs.getDate("spe.data"));
                p.setStatus(rs.getString("spe.status"));
                p.setSpese(rs.getDouble("spe.spese"));
                p.setIdSpedizione(rs.getLong("spe.idSpedizione"));
                Ordine o = new Ordine();
                o.setIva(rs.getDouble("ord.iva"));
                o.setDataInserimento(rs.getDate("ord.dataInserimento"));
                o.setIdOrdine(rs.getInt("ord.idOrdine"));
                p.setOrdine(o);
                return p;
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return null;
    }

}
