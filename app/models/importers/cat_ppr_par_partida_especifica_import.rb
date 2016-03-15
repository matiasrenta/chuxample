
class CatPprParPartidaEspecificaImport < BaseImport
  def create_entity_from_row(row)
    cat_ppr_par_partida_especifica = CatPprParPartidaEspecifica.new
    cat_ppr_par_partida_especifica.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ppr_par_partida_especifica.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ppr_par_partida_especifica.cat_ppr_par_partida_generica_id = CatPprParPartidaGenerica.find_by_key("#{cat_ppr_par_partida_especifica.key[0..2]}0").id
    cat_ppr_par_partida_especifica
  end
end


