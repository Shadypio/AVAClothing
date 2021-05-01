package model;

import java.sql.*;
import java.util.ArrayList;

public class OrdineDAO {

    public void addOrdine(Ordine p){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO ordine (id, IVA, dataInserimento) VALUES(?,?,?)");
            ps.setLong(1, p.getIdOrdine());
            ps.setDouble(2, p.getIVA());
            ps.setDate(3, p.getDataInserimento());

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
            String query = "update Ordine set id='" + p.getIdOrdine() + "', IVA='" +
                    p.getIVA() + "', data="+p.getDataInserimento() + " where id=" + p.getIdOrdine() + ";";
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
                p.setIdOrdine(rs.getInt(1));
                p.setIVA(rs.getDouble(2));
                p.setDataInserimento(rs.getDate(3));
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
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Ordine WHERE id=?");
            ps.setLong(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Ordine p = new Ordine();
                p.setIdOrdine(rs.getInt(1));
                p.setIVA(rs.getDouble(2));
                p.setDataInserimento(rs.getDate(3));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}



