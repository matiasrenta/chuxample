
class CatPgdLineOfActionImport < BaseImport
  def create_entity_from_row(row)
    cat_pgd_line_of_action = CatPgdLineOfAction.new
    cat_pgd_line_of_action.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_pgd_line_of_action.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_pgd_line_of_action.cat_pgd_goal_id = CatPgdGoal.find_by_key(cat_pgd_line_of_action.key[0..7]).id
    cat_pgd_line_of_action
  end
end
