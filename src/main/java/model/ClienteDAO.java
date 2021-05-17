package model;

import java.sql.*;
import java.util.ArrayList;

public class ClienteDAO {
    public ArrayList<Cliente> doRetrieveAll(){
        ArrayList<Cliente> result=new ArrayList<Cliente>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM cliente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Cliente p = new Cliente();
                p.setNome(rs.getString(1));  // perche warning?????
                p.setCognome(rs.getString(2));
                p.setEmail(rs.getString(3));
                p.setUsername(rs.getString(4));
                p.setPassword(rs.getString(5));
                p.setIndirizzo(rs.getString(6));
                p.setRegistrato(rs.getBoolean(7));
                p.setTelefono(rs.getString(8));
                p.setIdCliente(rs.getLong(9));
                result.add(p);
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Cliente doRetrieveClienteWithOrdini(long id){
        Cliente p = new Cliente();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM cliente INNER JOIN ordine ON cliente.idCliente = ordine.cli_fk WHERE cliente.idCliente = " + id;
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setNome(rs.getString(1));
                p.setCognome(rs.getString(2));
                p.setEmail(rs.getString(3));
                p.setUsername(rs.getString(4));
                p.setPassword(rs.getString(5));
                p.setIndirizzo(rs.getString(6));
                p.setRegistrato(rs.getBoolean(7));
                p.setTelefono(rs.getString(8));
                p.setIdCliente(rs.getLong(9));
                while (rs.next()) {
                    Ordine o = new Ordine();
                    o.setIva(rs.getDouble(10));
                    o.setDataInserimento(rs.getDate(11));
                    o.setIdOrdine(rs.getLong(12));
                    p.getOrdini().add(o);
                }
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return p;
    }

    public Cliente doRetrieveById(long id){
        Cliente p = new Cliente();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM cliente WHERE idCliente=?");
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                p.setNome(rs.getString(1));
                p.setCognome(rs.getString(2));
                p.setEmail(rs.getString(3));
                p.setUsername(rs.getString(4));
                p.setPassword(rs.getString(5));
                p.setIndirizzo(rs.getString(6));
                p.setRegistrato(rs.getBoolean(7));
                p.setTelefono(rs.getString(8));
                p.setIdCliente(rs.getLong(9));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return p;
    }

    public void addCliente(Cliente p){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO cliente (nome, cognome, email, username, password, indirizzo, isRegistrato, telefono, idCliente) VALUES(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, p.getNome());
            ps.setString(2, p.getCognome());
            ps.setString(3, p.getEmail());
            ps.setString(4,p.getUsername());
            ps.setString(5,p.getPassword());
            ps.setString(6,p.getIndirizzo());
            ps.setBoolean(7, p.isRegistrato());
            ps.setString(8, p.getTelefono());
            ps.setLong(9,p.getIdCliente());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doChanges(Cliente c){
        try (Connection con = ConPool.getConnection()) {
            Statement st = con.createStatement();
            String query = "update Cliente set nome='" + c.getNome() + "', " + "cognome='"+c.getCognome() + "', email='"+c.getEmail() +"'," +
                    "username='"+c.getUsername()+"',password='"+c.getPassword()+"', indirizzo='"+c.getIndirizzo()+"', isRegistrato="+
                    c.isRegistrato()+", telefono='"+c.getTelefono()+"',where idCliente=" + c.getIdCliente() + ";";
            st.executeUpdate(query);
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
