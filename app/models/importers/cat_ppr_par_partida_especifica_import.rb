
class CatPprParPartidaEspecificaImport < BaseImport
  def create_entity_from_row(row)
    cat_ppr_par_partida_especifica = CatPprParPartidaEspecifica.new
    cat_ppr_par_partida_especifica.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ppr_par_partida_especifica.description = row[I18n.translate('simple_form.labels.defaults.description')]

    if ['443','811','812','813','816','831','832','833','834','835','851','852','853'].include? cat_ppr_par_partida_especifica.key[0..2]
      cat_ppr_par_partida_especifica = nil
    else
      cat_ppr_par_partida_especifica.cat_ppr_par_partida_generica_id = CatPprParPartidaGenerica.find_by_key("#{cat_ppr_par_partida_especifica.key[0..2]}0").id
    end
    cat_ppr_par_partida_especifica
  end
end


