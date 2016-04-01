
class CatPgdGoalImport < BaseImport
  def create_entity_from_row(row)
    cat_pgd_goal = CatPgdGoal.new
    cat_pgd_goal.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_pgd_goal.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_pgd_goal.cat_pgd_objective_id = CatPgdObjective.find_by_key(cat_pgd_goal.key[0..5]).id
    cat_pgd_goal
  end
end
