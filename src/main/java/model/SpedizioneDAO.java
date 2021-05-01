package model;

import java.sql.*;
import java.util.LinkedList;

public class SpedizioneDAO {

    public Spedizione doRetrieveByIdSpedizione(long id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM spedizione WHERE id=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Spedizione p = new Spedizione();
                p.setIdSpedizione(rs.getLong(1));
                p.setData(rs.getDate(2));
                p.setStatus(rs.getString(3));
                p.setSpese(rs.getDouble(4));
                // p.setOrdine
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
                p.setIdSpedizione(rs.getLong(1));
                p.setData(rs.getDate(2));
                p.setStatus(rs.getString(3));
                p.setSpese(rs.getDouble(4));
                // p.setOrdine
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
            // gestire l'ordine
            String query = "UPDATE spedizione s SET s.data = \"" + data + "\", s.status = \"" + status + "\", " +
                    "s.spese = " + spese + " WHERE s.Id = " + idSpedizione + "";
            PreparedStatement s = con.prepareStatement(query);
            s.execute();
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public void addSpedizione(Spedizione spedizione) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO spedizione (id, data, status, spese) VALUES(?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1, spedizione.getIdSpedizione());
            ps.setDate(2, (Date) spedizione.getData());
            ps.setString(3, spedizione.getStatus());
            ps.setDouble(4, spedizione.getSpese());
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

}
