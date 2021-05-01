package model;

import java.util.ArrayList;
import java.util.Objects;

public class Prodotto {

    public Prodotto(){

    }

    public Prodotto(long idProdotto, String nome, double prezzo, boolean isInOfferta, String descrizioneBreve, String descrizioneDettagliata) {
        this.idProdotto = idProdotto;
        this.nome = nome;
        this.prezzo = prezzo;
        this.isInOfferta = isInOfferta;
        this.descrizioneBreve = descrizioneBreve;
        this.descrizioneDettagliata = descrizioneDettagliata;
    }

    public long getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(long idProdotto) {
        this.idProdotto = idProdotto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public boolean isInOfferta() {
        return isInOfferta;
    }

    public void setInOfferta(boolean inOfferta) {
        isInOfferta = inOfferta;
    }

    public String getDescrizioneBreve() {
        return descrizioneBreve;
    }

    public void setDescrizioneBreve(String descrizioneBreve) {
        this.descrizioneBreve = descrizioneBreve;
    }

    public String getDescrizioneDettagliata() {
        return descrizioneDettagliata;
    }

    public void setDescrizioneDettagliata(String descrizioneDettagliata) {
        this.descrizioneDettagliata = descrizioneDettagliata;
    }

    public ArrayList<Ordine> getOrdini() {
        return ordini;
    }

    public void setOrdini(ArrayList<Ordine> ordini) {
        this.ordini = ordini;
    }

    @Override
    public String toString() {
        return "Prodotto{" +
                "idProdotto=" + idProdotto +
                ", nome='" + nome + '\'' +
                ", prezzo=" + prezzo +
                ", isInOfferta=" + isInOfferta +
                ", descrizioneBreve='" + descrizioneBreve + '\'' +
                ", descrizioneDettagliata='" + descrizioneDettagliata + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Prodotto prodotto = (Prodotto) o;
        return idProdotto == prodotto.idProdotto;
    }

    private long idProdotto;
    private String nome;
    private double prezzo;
    private boolean isInOfferta;
    private String descrizioneBreve;
    private String descrizioneDettagliata;
    private ArrayList<Ordine> ordini;
    private Magazzino magazzino;
    private Categoria categoria;

}
