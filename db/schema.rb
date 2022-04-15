# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_04_080255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agsks", force: :cascade do |t|
    t.text "requirement", null: false
    t.string "concept"
    t.string "descriptor"
    t.boolean "without_a_filter", default: false
    t.boolean "formalizable", default: false
    t.boolean "not_formalized", default: false
    t.boolean "reference", default: false
    t.boolean "by_hierarchy", default: false
    t.boolean "legislative_level_codes", default: false
    t.boolean "legislative_level_the_laws", default: false
    t.boolean "derived_level_technical_regulations", default: false
    t.boolean "derived_level_rules", default: false
    t.boolean "derived_level_sanitary_regulations", default: false
    t.boolean "performance_requirements_interstate_building_codes", default: false
    t.boolean "performance_requirements_building_codes", default: false
    t.boolean "performance_requirements_guiding_documents_in_construction", default: false
    t.boolean "acceptable_solutions_interstate_codes_of_practice", default: false
    t.boolean "acceptable_code_of_practice_solutions", default: false
    t.boolean "acceptable_solutions_recommendations_instructions_normative_tec", default: false
    t.boolean "acceptable_solutions_interstate_standards", default: false
    t.boolean "acceptable_solutions_standards", default: false
    t.boolean "effective_solutions_special_technical_conditions", default: false
    t.boolean "effective_solutions_test_reports", default: false
    t.boolean "effective_solutions_organization_standards", default: false
    t.boolean "by_types_of_buildings", default: false
    t.boolean "general_requirements", default: false
    t.boolean "public_buildings_schools", default: false
    t.boolean "public_buildings_medical_institutions", default: false
    t.boolean "public_buildings_organizations_of_preschool_education_and_train", default: false
    t.boolean "public_buildings_athletic_facilities", default: false
    t.boolean "public_buildings_administrative_and_service_buildings", default: false
    t.boolean "industrial_buildings_agricultural_enterprises", default: false
    t.boolean "buildings_of_individual_housing_construction", default: false
    t.boolean "residential_buildings", default: false
    t.boolean "by_scope", default: false
    t.boolean "general_provisions", default: false
    t.boolean "construction_site_and_master_plan_specialized_sites_parking_lot", default: false
    t.boolean "construction_site_and_master_plan_ancillary_buildings", default: false
    t.boolean "architectural_planning_solutions_functionality", default: false
    t.boolean "architectural_planning_solutions_space_planning_solutions", default: false
    t.boolean "architectural_planning_solutions_mgn", default: false
    t.boolean "design_solutions_reinforced_concrete_structures", default: false
    t.boolean "design_solutions_metal_structures", default: false
    t.boolean "design_solutions_seismic", default: false
    t.boolean "design_solutions_structural_analysis", default: false
    t.boolean "security_requirements_reliability_of_structures", default: false
    t.boolean "security_requirements_fire_prevention", default: false
    t.boolean "security_requirements_evacuation_in_case_of_fires_and_other_eme", default: false
    t.boolean "security_requirements_antiterrorist_activities", default: false
    t.boolean "sanitary_and_hygiene_requirements_vygiene", default: false
    t.boolean "sanitary_and_hygiene_requirements_noise_vibration", default: false
    t.boolean "sanitary_and_hygiene_requirements_varmful_radiation", default: false
    t.boolean "engineering_systems_veating_and_ventilation", default: false
    t.boolean "engineering_systems_water_supply_and_sewerage", default: false
    t.boolean "engineering_systems_electrical", default: false
    t.boolean "energy_saving_and_environmental_protection_ensuring_environment", default: false
    t.boolean "energy_saving_and_environmental_protection_reducing_energy_cons", default: false
    t.boolean "energy_saving_and_environmental_protection_rational_use_of_natu", default: false
    t.boolean "according_to_the_stage_of_the_life_cycle_of_a_building", default: false
    t.boolean "project", default: false
    t.boolean "requirements_for_construction_documentation", default: false
    t.boolean "construction", default: false
    t.boolean "exploitation", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_agsks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.date "birthday"
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agsks", "users"
end
