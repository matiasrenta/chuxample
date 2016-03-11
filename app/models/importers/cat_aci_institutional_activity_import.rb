
class CatAciInstitutionalActivityImport < BaseImport
  def create_entity_from_row(row)
    cat_aci_institutional_activity = CatAciInstitutionalActivity.new
    cat_aci_institutional_activity.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_aci_institutional_activity.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_aci_institutional_activity.cat_pgd_axi_id = CatPgdAxi.find_by_key("#{row['E']}.").id
    cat_aci_institutional_activity.cat_ere_expending_focu_id = CatEreExpendingFocu.find_by_key(row['EG']).id
    cat_aci_institutional_activity.cat_ere_result_id = CatEreResult.find_by_key("#{row['EG']}.#{row['R']}").id
    cat_aci_institutional_activity.cat_ere_subresult_id = CatEreSubresult.find_by_key("#{row['EG']}.#{row['R']}.#{row['SR']}").id
    cat_aci_institutional_activity.cat_cfu_finality_id = CatCfuFinality.find_by_key(row['FI']).id
    cat_aci_institutional_activity.cat_cfu_function_id = CatCfuFunction.find_by_key("#{row['FI']}.#{row['F']}").id
    cat_aci_institutional_activity.cat_cfu_subfunction_id = CatCfuSubfunction.find_by_key("#{row['FI']}.#{row['F']}.#{row['SF']}").id
    cat_aci_institutional_activity
  end
end

