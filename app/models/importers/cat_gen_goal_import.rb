
class CatGenGoalImport < BaseImport
  def create_entity_from_row(row)
    cat_gen_goal = CatGenGoal.new
    cat_gen_goal.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_gen_goal.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_gen_goal.cat_gen_strategy_id = CatGenStrategy.find_by_key(cat_gen_goal.key[0..8]).id
    cat_gen_goal
  end
end
