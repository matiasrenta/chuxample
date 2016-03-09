class CatDerHumanRightImport < BaseImport
  def create_entity_from_row(row)
    cat_der_human_right = CatDerHumanRight.new
    cat_der_human_right.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_der_human_right.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_der_human_right
  end
end

