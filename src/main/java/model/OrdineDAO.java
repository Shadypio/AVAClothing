package model;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * GESTIRE LE FOREIGN KEY PER OGNI METODO
 */

public class OrdineDAO {

    public void addOrdine(Ordine p){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO ordine (iva, dataInserimento, idOrdine) VALUES(?,?,?)");
            ps.setDouble(1, p.getIva());
            ps.setDate(2, p.getDataInserimento());
            ps.setLong(3, p.getIdOrdine());

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
            String query = "update Ordine set idOrdine='" + p.getIdOrdine() + "', iva='" +
                    p.getIva() + "', dataInserimento="+p.getDataInserimento() + " where idOrdine=" + p.getIdOrdine() + ";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public ArrayList<Ordine> doRetrieveAll(){
        ArrayList<Ordine> result=new ArrayList<Ordine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM ordine");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine p = new Ordine();
                p.setIva(rs.getDouble(1));
                p.setDataInserimento(rs.getDate(2));
                p.setIdOrdine(rs.getInt(3));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Ordine> doRetrieveByIdOrdine(long id){
        ArrayList<Ordine> result=new ArrayList<Ordine>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Ordine WHERE idOrdine=?");
            ps.setLong(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine p = new Ordine();
                p.setIva(rs.getDouble(1));
                p.setDataInserimento(rs.getDate(2));
                p.setIdOrdine(rs.getInt(3));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}



