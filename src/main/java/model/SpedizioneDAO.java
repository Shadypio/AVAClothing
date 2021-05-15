package model;

import java.sql.*;
import java.util.LinkedList;

/**
 *
 * GESTIRE LE FOREIGN KEY PER OGNI METODO
 */

public class SpedizioneDAO {

    public Spedizione doRetrieveById(long id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM spedizione WHERE idSpedizione=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Spedizione p = new Spedizione();
                p.setData(rs.getDate(1));
                p.setStatus(rs.getString(2));
                p.setSpese(rs.getDouble(3));
                p.setIdSpedizione(rs.getLong(4));
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
            PreparedStatement s = con.prepareStatement("SELECT * FROM spedizione");
            ResultSet rs = s.executeQuery();
            while(rs.next()){
                Spedizione p = new Spedizione();
                p.setData(rs.getDate(1));
                p.setStatus(rs.getString(2));
                p.setSpese(rs.getDouble(3));
                p.setIdSpedizione(rs.getLong(4));
                spedizioni.add(p);
            }
            return spedizioni;
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    // da' errori, commentato per evitare problemi nel commmit
    /*public boolean doChanges(Spedizione spedizione){
        try(Connection con = ConPool.getConnection()){
            long idSpedizione = spedizione.getIdSpedizione();
            Date data = (Date) spedizione.getData();
            String status = spedizione.getStatus();
            double spese = spedizione.getSpese();
            // gestire l'ordine
            String query = "UPDATE spedizione s SET s.data = \"" + data + "\", s.status = \"" + status + "\", " +
                    "s.spese = " + spese + " WHERE s.Id = " + idSpedizione + "";
            PreparedStatement s = con.prepareStatement(query);
            s.execute();
            return true;
        } catch(SQLException e){
            return false;
        }
    }*/

    public void addSpedizione(Spedizione spedizione) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO spedizione (dataSpedizione, statusSpedizione, spese, idSpedizione) VALUES(?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, (Date) spedizione.getData());
            ps.setString(2, spedizione.getStatus());
            ps.setDouble(3, spedizione.getSpese());
            ps.setLong(4, spedizione.getIdSpedizione());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            long id = rs.getLong(1);
            spedizione.setIdSpedizione(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Spedizione doRetrieveSpedizioneWithOrdine(long id){
        Spedizione p = new Spedizione();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM spedizione INNER JOIN ordine ON spedizione.ord_fk = ordine.idOrdine WHERE ordine.idOrdine = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setData(rs.getDate(1));
                p.setStatus(rs.getString(2));
                p.setSpese(rs.getDouble(3));
                p.setIdSpedizione(rs.getLong(4));
                Ordine o = new Ordine();
                o.setIva(rs.getDouble(5));
                o.setDataInserimento(rs.getDate(6));
                o.setIdOrdine(rs.getLong(7));
                p.setOrdine(o);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return p;
    }

}
