package model.prodotto;

import model.ResultSetExtractor;
import model.categoria.Categoria;

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
        p.setQuantita(rs.getInt("pro.quantita"));
        int idcat=rs.getInt("pro.cat_fk");
        Categoria c=new Categoria();
        c.setIdCategoria(idcat);
        p.setCategoria(c);
        return p;
    }
}
