# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170320224436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "api_keys", force: :cascade do |t|
    t.string   "application"
    t.string   "access_token"
    t.text     "note"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "access_only_with_token"
  end

  create_table "api_users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role_id"
    t.string   "locale"
    t.string   "time_zone"
    t.string   "avatar_id"
    t.string   "avatar_filename"
    t.integer  "avatar_size"
    t.string   "avatar_content_type"
    t.datetime "last_seen_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "api_users", ["confirmation_token"], name: "index_api_users_on_confirmation_token", unique: true, using: :btree
  add_index "api_users", ["email"], name: "index_api_users_on_email", unique: true, using: :btree
  add_index "api_users", ["reset_password_token"], name: "index_api_users_on_reset_password_token", unique: true, using: :btree

  create_table "ascriptions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombres"
    t.integer  "territorial_unit_id"
    t.string   "sexo"
    t.date     "fecha_nacimiento"
    t.string   "lugar_nacimiento"
    t.string   "pertenencia_etnica"
    t.string   "grado_maximo_estudios"
    t.float    "anios_residencia_en_df"
    t.text     "domicilio"
    t.text     "ocupacion"
    t.string   "nombre_padre"
    t.string   "nombre_madre"
    t.string   "curp"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "project_activity_social_id"
  end

  create_table "cat_aci_institutional_activities", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_pgd_axi_id"
    t.integer  "cat_ere_expending_focu_id"
    t.integer  "cat_ere_result_id"
    t.integer  "cat_ere_subresult_id"
    t.integer  "cat_cfu_finality_id"
    t.integer  "cat_cfu_function_id"
    t.integer  "cat_cfu_subfunction_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cat_are_areas", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_cfu_finalities", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_cfu_functions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_cfu_finality_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "cat_cfu_subfunctions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_cfu_function_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "cat_der_human_rights", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_der_line_of_actions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_der_strategy_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "cat_der_strategies", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_der_human_right_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_ere_expending_focus", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_ere_results", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_ere_expending_focu_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cat_ere_subresults", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_ere_result_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cat_fon_funding_sources", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_fon_funds", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_fon_funding_source_id"
    t.integer  "cat_fon_generic_source_id"
    t.integer  "cat_fon_specific_source_id"
    t.integer  "cat_fon_year_document_id"
    t.integer  "cat_fon_origin_resource_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cat_fon_generic_sources", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_fon_origin_resources", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_fon_specific_sources", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_fon_year_documents", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_gen_axis", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "objetivo"
  end

  create_table "cat_gen_line_of_actions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "cat_gen_strategy_id"
  end

  create_table "cat_gen_strategies", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "meta"
    t.integer  "cat_gen_axi_id"
  end

  create_table "cat_pgd_area_of_opportunities", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_pgd_axi_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cat_pgd_axis", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_pgd_goals", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_pgd_objective_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "cat_pgd_line_of_actions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_pgd_goal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cat_pgd_objectives", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_pgd_area_of_opportunity_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "cat_ppr_digit_identifiers", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_ppr_expense_types", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_ppr_par_chapters", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_ppr_par_concepts", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_ppr_par_chapter_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_ppr_par_partida_especificas", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_ppr_par_partida_generica_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "cat_ppr_par_partida_genericas", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_ppr_par_concept_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cat_ppr_spending_destinations", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cat_uni_measure_units", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chucky_bot_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.string   "i18n_name"
    t.text     "formats_options"
    t.text     "validations_options"
    t.text     "association_options"
    t.integer  "chucky_bot_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "chucky_bots", force: :cascade do |t|
    t.string   "underscore_model_name"
    t.string   "i18n_singular_name"
    t.string   "i18n_plural_name"
    t.text     "authorization"
    t.text     "public_activity"
    t.boolean  "migrate"
    t.text     "chucky_command"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "fa_icon"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "fin_doc_types_chapters", id: false, force: :cascade do |t|
    t.integer "financial_document_type_id"
    t.integer "chapter_id"
  end

  add_index "fin_doc_types_chapters", ["chapter_id"], name: "index_fin_doc_types_chapters_on_chapter_id", using: :btree
  add_index "fin_doc_types_chapters", ["financial_document_type_id"], name: "index_fin_doc_types_chapters_on_financial_document_type_id", using: :btree

  create_table "financial_document_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "system_doc_type"
  end

  create_table "financial_documents", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "financial_document_type_id"
    t.string   "nro_documento"
    t.float    "monto"
    t.integer  "supplier_id"
    t.integer  "financial_document_contract_id"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.string   "type"
    t.integer  "project_activityable_id"
    t.string   "project_activityable_type"
    t.text     "description"
    t.date     "fecha_expedicion"
    t.date     "fecha_finalizacion"
  end

  create_table "job_titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "key_analyticals", force: :cascade do |t|
    t.integer  "cat_pgd_axi_id"
    t.integer  "cat_ere_expending_focu_id"
    t.integer  "cat_ere_result_id"
    t.integer  "cat_ere_subresult_id"
    t.integer  "year"
    t.string   "sector"
    t.string   "subsector"
    t.string   "unidad_responsable"
    t.integer  "cat_cfu_finality_id"
    t.integer  "cat_cfu_function_id"
    t.integer  "cat_cfu_subfunction_id"
    t.integer  "cat_aci_institutional_activity_id"
    t.integer  "cat_fon_funding_source_id"
    t.integer  "cat_fon_generic_source_id"
    t.integer  "cat_fon_specific_source_id"
    t.integer  "cat_fon_year_document_id"
    t.integer  "cat_fon_origin_resource_id"
    t.integer  "cat_fon_fund_id"
    t.integer  "cat_ppr_par_chapter_id"
    t.integer  "cat_ppr_par_concept_id"
    t.integer  "cat_ppr_par_partida_generica_id"
    t.integer  "cat_ppr_par_partida_especifica_id"
    t.integer  "cat_ppr_expense_type_id"
    t.integer  "cat_ppr_digit_identifier_id"
    t.integer  "cat_ppr_spending_destination_id"
    t.string   "proyecto_de_inversion"
    t.integer  "cat_are_area_id"
    t.float    "autorizado"
    t.float    "enero"
    t.float    "febrero"
    t.float    "marzo"
    t.float    "abril"
    t.float    "mayo"
    t.float    "junio"
    t.float    "julio"
    t.float    "agosto"
    t.float    "septiembre"
    t.float    "octubre"
    t.float    "noviembre"
    t.float    "diciembre"
    t.integer  "cat_uni_measure_unit_id"
    t.integer  "meta_fisica"
    t.text     "descripcion_de_las_acciones"
    t.text     "domicilio_del_area"
    t.text     "dut_de_la_accion"
    t.integer  "poblacion_beneficiada"
    t.integer  "cat_der_human_right_id"
    t.integer  "cat_der_strategy_id"
    t.integer  "cat_der_line_of_action_id"
    t.float    "porcentaje_igualdad_sustantiva"
    t.integer  "mujeres"
    t.integer  "hombres"
    t.integer  "cat_gen_axi_id"
    t.integer  "cat_gen_strategy_id"
    t.integer  "cat_gen_line_of_action_id"
    t.integer  "cat_pgd_area_of_opportunity_id"
    t.integer  "cat_pgd_objective_id"
    t.integer  "cat_pgd_goal_id"
    t.integer  "cat_pgd_line_of_action_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "justificacion_derechos_humanos"
    t.text     "justificacion_genero"
    t.string   "key_analytical_string"
    t.string   "project_type"
    t.string   "short_key_analytical_string"
    t.string   "status"
    t.float    "original"
    t.float    "modificado"
    t.float    "programado"
    t.float    "ejercido"
  end

  create_table "ley_articulos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "name"
    t.text     "descripcion_de_documento"
    t.string   "periodo_actualizacion"
    t.date     "actualizado"
    t.date     "validado"
    t.text     "detalle"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ley_fraccions", force: :cascade do |t|
    t.string   "codigo"
    t.string   "name"
    t.text     "descripcion_de_documento"
    t.string   "periodo_actualizacion"
    t.date     "actualizado"
    t.date     "validado"
    t.text     "detalle"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.integer  "ley_articulo_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "nomina_document_items", force: :cascade do |t|
    t.integer  "cat_ppr_par_partida_especifica_id"
    t.float    "monto"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "nomina_document_id"
  end

  create_table "nomina_documents", force: :cascade do |t|
    t.integer  "month"
    t.integer  "year"
    t.string   "file_id"
    t.string   "file_filename"
    t.string   "file_content_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "file_size"
    t.text     "monto_por_project"
  end

  create_table "open_data", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "labels"
    t.string   "published_by"
    t.string   "contact"
    t.string   "email"
    t.string   "access_level"
    t.string   "file_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "proj_nominas_nom_docs_joins", id: false, force: :cascade do |t|
    t.integer "project_nomina_id"
    t.integer "nomina_document_id"
  end

  add_index "proj_nominas_nom_docs_joins", ["nomina_document_id"], name: "index_proj_nominas_nom_docs_joins_on_nomina_document_id", using: :btree
  add_index "proj_nominas_nom_docs_joins", ["project_nomina_id"], name: "index_proj_nominas_nom_docs_joins_on_project_nomina_id", using: :btree

  create_table "project_activity_adquisicions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "calle"
    t.string   "nro_exterior"
    t.string   "nro_interior"
    t.string   "colonia"
    t.string   "codigo_postal"
    t.string   "tipo_adquisicion"
    t.integer  "cantidad"
    t.float    "avance_programado"
    t.float    "avance_real"
    t.date     "real_start_date"
    t.date     "real_end_date"
    t.integer  "project_adquisicion_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "ejercido"
  end

  create_table "project_activity_obras", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "calle"
    t.string   "nro_exterior"
    t.string   "nro_interior"
    t.string   "colonia"
    t.string   "codigo_postal"
    t.string   "tipo_obra"
    t.integer  "cantidad"
    t.float    "avance_programado"
    t.float    "avance_real"
    t.date     "real_start_date"
    t.date     "real_end_date"
    t.integer  "project_obra_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.float    "ejercido"
  end

  create_table "project_activity_socials", force: :cascade do |t|
    t.integer  "social_development_program_id"
    t.text     "comentarios"
    t.integer  "nro_beneficiarios"
    t.integer  "nro_metas_cumplidas"
    t.date     "fecha_inicio_real"
    t.date     "fecha_fin_real"
    t.integer  "project_social_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.float    "ejercido"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "list_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                    null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type",  limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "social_development_programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_users", force: :cascade do |t|
    t.string   "provider"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.text     "access_token"
    t.text     "json_data"
    t.integer  "uid",          limit: 8
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "nombres"
    t.string   "sexo"
    t.date     "fecha_nacimiento"
    t.boolean  "indefinido"
    t.date     "periodo_desde"
    t.date     "periodo_hasta"
    t.integer  "job_title_id"
    t.integer  "ascription_id"
    t.float    "anios_residencia_en_df"
    t.text     "domicilio"
    t.text     "ocupacion"
    t.string   "nombre_padre"
    t.string   "nombre_madre"
    t.string   "curp"
    t.float    "importe_actual"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "rfc"
    t.string   "razon_social"
    t.string   "name"
    t.string   "calle"
    t.string   "nro_exterior"
    t.string   "nro_interior"
    t.string   "entre_calles"
    t.integer  "state_id"
    t.integer  "town_id"
    t.string   "codigo_postal"
    t.text     "observaciones"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "territorial_units", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "grado_marginacion"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "thing_attaches", force: :cascade do |t|
    t.string   "file_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "thing_id"
    t.string   "file_filename"
    t.integer  "file_size"
    t.string   "file_content_type"
  end

  create_table "thing_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thing_contacts", force: :cascade do |t|
    t.string   "name"
    t.integer  "thing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
  end

  create_table "thing_parts", force: :cascade do |t|
    t.string   "name"
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "things", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.float    "price"
    t.date     "expires"
    t.datetime "discharged_at"
    t.text     "description"
    t.boolean  "published"
    t.string   "gender"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "thing_category_id"
    t.integer  "user_id"
  end

  create_table "things_thing_parts", id: false, force: :cascade do |t|
    t.integer "thing_id"
    t.integer "thing_part_id"
  end

  add_index "things_thing_parts", ["thing_id"], name: "index_things_thing_parts_on_thing_id", using: :btree
  add_index "things_thing_parts", ["thing_part_id"], name: "index_things_thing_parts_on_thing_part_id", using: :btree

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "state_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.string   "name"
    t.integer  "failed_attempts"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "locale"
    t.string   "time_zone"
    t.string   "avatar_id"
    t.string   "avatar_filename"
    t.integer  "avatar_size"
    t.string   "avatar_content_type"
    t.datetime "last_seen_at"
    t.datetime "deleted_at"
    t.integer  "viewing_year"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "verification_photos", force: :cascade do |t|
    t.integer  "verification_id"
    t.datetime "date_and_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
  end

  create_table "verifications", force: :cascade do |t|
    t.integer  "project_activity_obra_id"
    t.integer  "evaluation"
    t.text     "comments"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "answer"
    t.integer  "status",                     default: -1
    t.integer  "verification_owneable_id"
    t.string   "verification_owneable_type"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
