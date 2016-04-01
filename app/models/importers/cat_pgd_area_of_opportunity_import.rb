
class CatPgdAreaOfOpportunityImport < BaseImport
  def create_entity_from_row(row)
    cat_pgd_area_of_opportunity = CatPgdAreaOfOpportunity.new
    cat_pgd_area_of_opportunity.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_pgd_area_of_opportunity.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_pgd_area_of_opportunity.cat_pgd_axi_id = CatPgdAxi.find_by_key(cat_pgd_area_of_opportunity.key[0..1]).id
    cat_pgd_area_of_opportunity
  end
end
