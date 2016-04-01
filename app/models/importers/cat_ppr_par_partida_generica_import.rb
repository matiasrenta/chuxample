
class CatPprParPartidaGenericaImport < BaseImport
  def create_entity_from_row(row)
    cat_ppr_par_partida_generica = CatPprParPartidaGenerica.new
    cat_ppr_par_partida_generica.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ppr_par_partida_generica.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ppr_par_partida_generica.cat_ppr_par_concept_id = CatPprParConcept.find_by_key("#{cat_ppr_par_partida_generica.key[0..1]}00").id
    cat_ppr_par_partida_generica
  end
end
