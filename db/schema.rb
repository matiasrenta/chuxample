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

ActiveRecord::Schema.define(version: 20160312014157) do

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
  end

  create_table "cat_gen_goals", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_gen_strategy_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "cat_gen_line_of_actions", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_gen_goal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cat_gen_objectives", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_gen_axi_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cat_gen_strategies", force: :cascade do |t|
    t.string   "key"
    t.text     "description"
    t.integer  "cat_gen_objective_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
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

  create_table "key_meta_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "key_meta_subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "key_meta_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "key_meta_titles", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "key_meta_subcategory_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "key_meta_values", force: :cascade do |t|
    t.string   "key_value"
    t.string   "key_description"
    t.integer  "key_meta_title_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "list_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

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
  end

  create_table "things_thing_parts", id: false, force: :cascade do |t|
    t.integer "thing_id"
    t.integer "thing_part_id"
  end

  add_index "things_thing_parts", ["thing_id"], name: "index_things_thing_parts_on_thing_id", using: :btree
  add_index "things_thing_parts", ["thing_part_id"], name: "index_things_thing_parts_on_thing_part_id", using: :btree

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
    t.boolean  "only_api_access"
    t.string   "avatar_id"
    t.string   "avatar_filename"
    t.integer  "avatar_size"
    t.string   "avatar_content_type"
    t.datetime "last_seen_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
