class CatalogCleaner < Object
  ##@@all_catalogs = ['cat_der_human_right','cat_der_strategy','cat_der_line_of_action','cat_gen_axi','cat_gen_objective','cat_gen_strategy','cat_gen_goal','cat_gen_line_of_action','cat_pgd_axi','cat_pgd_area_of_opportunity','cat_pgd_objective','cat_pgd_goal','cat_pgd_line_of_action','cat_fon_funding_source','cat_fon_generic_source','cat_fon_specific_source','cat_fon_year_document','cat_fon_origin_resource','cat_fon_fund','cat_cfu_finality','cat_cfu_function','cat_cfu_subfunction','cat_ere_expending_focu','cat_ere_result','cat_ere_subresult','cat_ppr_expense_type','cat_ppr_digit_identifier','cat_ppr_spending_destination','cat_ppr_par_chapter','cat_ppr_par_concept','cat_ppr_par_partida_generica','cat_ppr_par_partida_especifica','cat_are_area','cat_uni_measure_unit']
  @@all_catalogs = ['cat_der_human_right','cat_der_strategy','cat_der_line_of_action','cat_gen_axi','cat_gen_objective','cat_gen_strategy','cat_gen_goal','cat_gen_line_of_action','cat_pgd_axi','cat_pgd_area_of_opportunity','cat_pgd_objective','cat_pgd_goal','cat_pgd_line_of_action','cat_fon_funding_source','cat_fon_generic_source','cat_fon_specific_source','cat_fon_year_document','cat_fon_origin_resource','cat_fon_fund','cat_cfu_finality','cat_cfu_function','cat_cfu_subfunction','cat_ere_expending_focu','cat_ere_result','cat_ere_subresult','cat_ppr_expense_type','cat_ppr_digit_identifier','cat_ppr_par_chapter','cat_ppr_par_concept','cat_ppr_par_partida_generica','cat_ppr_par_partida_especifica','cat_are_area','cat_uni_measure_unit']

  def self.clean_catalogs
    @@all_catalogs.each do |catalog|
      model = Object.const_get catalog.camelcase
      model.all.each do |record|
        record.key = record.key.strip.chomp('.')
        description = record.description.strip
        description = description.chomp('.') unless ( description.end_with?('D. F.') || description.end_with?('D.F.') )
        record.description = description
        record.save!
      end
    end
  end
end