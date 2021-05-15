package model;

import java.util.ArrayList;
import java.util.Objects;

public class Cliente {
    public Cliente(){ super(); }
    public String getCognome() { return cognome; }
    public void setCognome(String cognome) { this.cognome = cognome; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getIndirizzo() { return indirizzo; }
    public void setIndirizzo(String indirizzo) { this.indirizzo = indirizzo; }
    public long getIdCliente() { return idCliente; }
    public void setIdCliente(long idCliente) { this.idCliente = idCliente; }
    public boolean isRegistrato() { return isRegistrato; }
    public void setRegistrato(boolean registrato) { isRegistrato = registrato; }
    public ArrayList<Ordine> getOrdini() { return ordini; }
    public void setOrdini(ArrayList<Ordine> order) { this.ordini = ordini; }
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cliente cliente = (Cliente) o;
        return idCliente == cliente.idCliente;
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "cognome='" + cognome + '\'' +
                ", nome='" + nome + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", indirizzo='" + indirizzo + '\'' +
                ", telefono='" + telefono + '\'' +
                ", idCliente=" + idCliente +
                ", isRegistrato=" + isRegistrato +
                '}';
    }

    private String cognome;
    private String nome;
    private String email;
    private String username;
    private String password;
    private String indirizzo;
    private String telefono;
    private long idCliente;
    private boolean isRegistrato;
    ArrayList<Ordine> ordini;
}
