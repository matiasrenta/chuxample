
class CatPgdAxiImport < BaseImport
  def create_entity_from_row(row)
    cat_pgd_axi = CatPgdAxi.new
    cat_pgd_axi.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_pgd_axi.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_pgd_axi
  end
end
