
class CatGenObjectiveImport < BaseImport
  def create_entity_from_row(row)
    cat_gen_objective = CatGenObjective.new
    cat_gen_objective.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_gen_objective.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_gen_objective.cat_gen_axi_id = CatGenAxi.find_by_key(cat_gen_objective.key[0..1]).id
    cat_gen_objective
  end
end
