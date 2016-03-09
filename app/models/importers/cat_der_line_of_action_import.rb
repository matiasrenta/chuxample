class CatDerLineOfActionImport < BaseImport
  def create_entity_from_row(row)
    cat_der_line_of_action = CatDerLineOfAction.new
    cat_der_line_of_action.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_der_line_of_action.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_der_line_of_action.cat_der_strategy_id = CatDerStrategy.find_by_key(cat_der_line_of_action.key[0..5]).id
    cat_der_line_of_action
  end
end

