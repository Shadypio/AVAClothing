package model;

import java.sql.Date;

public class Ordine {
    public Ordine() {  }

    public long getIdOrdine() { return idOrdine; }
    public void setIdOrdine(long idOrdine) { this.idOrdine = idOrdine; }
    public Double getIVA() { return IVA; }
    public void setIVA(Double IVA) { this.IVA = IVA; }
    public Date getDataInserimento() { return dataInserimento; }
    public void setDataInserimento(Date dataInserimento) { this.dataInserimento = dataInserimento; }

    public String toString() {
        return "Ordine{" +
                "idOrdine=" + idOrdine +
                ", IVA=" + IVA +
                ", dataInserimento=" + dataInserimento +
                '}';
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ordine ordine = (Ordine) o;
        return idOrdine == ordine.idOrdine;
    }

    private long idOrdine;
    private Double IVA;
    private Date dataInserimento;
}
