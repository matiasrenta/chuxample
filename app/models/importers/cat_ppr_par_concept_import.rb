
class CatPprParConceptImport < BaseImport
  def create_entity_from_row(row)
    cat_ppr_par_concept = CatPprParConcept.new
    cat_ppr_par_concept.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ppr_par_concept.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ppr_par_concept.cat_ppr_par_chapter_id = CatPprParChapter.find_by_key("#{cat_ppr_par_concept.key[0]}000").id
    cat_ppr_par_concept
  end
end
