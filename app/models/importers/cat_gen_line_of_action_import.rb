
class CatGenLineOfActionImport < BaseImport
  def create_entity_from_row(row)
    cat_gen_line_of_action = CatGenLineOfAction.new
    cat_gen_line_of_action.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_gen_line_of_action.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_gen_line_of_action.cat_gen_goal_id = CatGenGoal.find_by_key(cat_gen_line_of_action.key[0..11]).id
    cat_gen_line_of_action
  end
end
