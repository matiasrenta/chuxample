class CatDerStrategyImport < BaseImport
  def create_entity_from_row(row)
    cat_der_strategy = CatDerStrategy.new
    cat_der_strategy.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_der_strategy.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_der_strategy.cat_der_human_right_id = CatDerHumanRight.find_by_key(cat_der_strategy.key[0..2]).id
    cat_der_strategy
  end
end

