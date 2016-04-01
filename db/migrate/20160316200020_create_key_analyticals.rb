class CreateKeyAnalyticals < ActiveRecord::Migration
  def change
    create_table :key_analyticals do |t|
      t.integer :cat_pgd_axi_id
      t.integer :cat_ere_expending_focu_id
      t.integer :cat_ere_result_id
      t.integer :cat_ere_subresult_id
      t.integer :year
      t.string :sector
      t.string :subsector
      t.string :unidad_responsable
      t.integer :cat_cfu_finality_id
      t.integer :cat_cfu_function_id
      t.integer :cat_cfu_subfunction_id
      t.integer :cat_aci_institutional_activity_id
      t.integer :cat_fon_funding_source_id
      t.integer :cat_fon_generic_source_id
      t.integer :cat_fon_specific_source_id
      t.integer :cat_fon_year_document_id
      t.integer :cat_fon_origin_resource_id
      t.integer :cat_fon_fund_id
      t.integer :cat_ppr_par_chapter_id
      t.integer :cat_ppr_par_concept_id
      t.integer :cat_ppr_par_partida_generica_id
      t.integer :cat_ppr_par_partida_especifica_id
      t.integer :cat_ppr_expense_type_id
      t.integer :cat_ppr_digit_identifier_id
      t.integer :cat_ppr_spending_destination_id
      t.string :proyecto_de_inversion
      t.integer :cat_are_area_id
      t.float :autorizado
      t.float :enero
      t.float :febrero
      t.float :marzo
      t.float :abril
      t.float :mayo
      t.float :junio
      t.float :julio
      t.float :agosto
      t.float :septiembre
      t.float :octubre
      t.float :noviembre
      t.float :diciembre
      t.integer :cat_uni_measure_unit_id
      t.integer :meta_fisica
      t.text :descripcion_de_las_acciones
      t.text :domicilio_del_area
      t.text :dut_de_la_accion
      t.integer :poblacion_beneficiada
      t.integer :cat_der_human_right_id
      t.integer :cat_der_strategy_id
      t.integer :cat_der_line_of_action_id
      t.text :justificacion
      t.float :porcentaje_igualdad_sustantiva
      t.integer :mujeres
      t.integer :hombres
      t.integer :cat_gen_axi_id
      t.integer :cat_gen_objective_id
      t.integer :cat_gen_strategy_id
      t.integer :cat_gen_goal_id
      t.integer :cat_gen_line_of_action_id
      t.integer :cat_pgd_area_of_opportunity_id
      t.integer :cat_pgd_objective_id
      t.integer :cat_pgd_goal_id
      t.integer :cat_pgd_line_of_action_id

      t.timestamps null: false
    end
  end
end
