
class CatEreExpendingFocuImport < BaseImport
  def create_entity_from_row(row)
    cat_ere_expending_focu = CatEreExpendingFocu.new
    cat_ere_expending_focu.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ere_expending_focu.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ere_expending_focu
  end
end
