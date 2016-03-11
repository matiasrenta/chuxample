
class CatGenStrategyImport < BaseImport
  def create_entity_from_row(row)
    cat_gen_strategy = CatGenStrategy.new
    cat_gen_strategy.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_gen_strategy.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_gen_strategy.cat_gen_objective_id = CatGenObjective.find_by_key(cat_gen_strategy.key[0..4]).id
    cat_gen_strategy
  end
end
