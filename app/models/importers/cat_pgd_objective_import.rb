
class CatPgdObjectiveImport < BaseImport
  def create_entity_from_row(row)
    cat_pgd_objective = CatPgdObjective.new
    cat_pgd_objective.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_pgd_objective.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_pgd_objective.cat_pgd_area_of_opportunity_id = CatPgdAreaOfOpportunity.find_by_key(cat_pgd_objective.key[0..3]).id
    cat_pgd_objective
  end
end
