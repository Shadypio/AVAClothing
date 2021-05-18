package model.prodotto;

import model.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProdottoExtractor implements ResultSetExtractor<Prodotto> {
    @Override
    public Prodotto extract(ResultSet rs) throws SQLException {
        Prodotto p = new Prodotto();
        p.setNome(rs.getString("pro.nome"));
        p.setPrezzo(rs.getDouble("pro.prezzo"));
        p.setDescrizioneBreve((rs.getString("pro.descrizioneBreve")));
        p.setDescrizioneDettagliata((rs.getString("pro.descrizioneDettagliata")));
        p.setInOfferta(rs.getBoolean("pro.inOfferta"));
        p.setIdProdotto(rs.getLong("pro.idProdotto"));
        return p;
    }
}
