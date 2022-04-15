class CreateAgsks < ActiveRecord::Migration[7.0]
  def change
    create_table :agsks do |t|
      t.text     :requirement, null: false, unique: true
      t.boolean  :without_a_filter, default: false      
      t.string   :concept
      t.string   :descriptor

      t.boolean  :formalizable, default: false
      t.boolean  :not_formalized, default: false
      t.boolean  :reference, default: false
      t.boolean  :by_hierarchy, default: false
      t.boolean  :legislative_level_codes, default: false
      t.boolean  :legislative_level_the_laws, default: false
      t.boolean  :derived_level_technical_regulations, default: false
      t.boolean  :derived_level_rules, default: false
      t.boolean  :derived_level_sanitary_regulations, default: false
      t.boolean  :performance_requirements_interstate_building_codes, default: false
      t.boolean  :performance_requirements_building_codes, default: false
      t.boolean  :performance_requirements_guiding_documents_in_construction, default: false
      t.boolean  :acceptable_solutions_interstate_codes_of_practice, default: false
      t.boolean  :acceptable_code_of_practice_solutions, default: false
      t.boolean  :acceptable_solutions_recommendations_instructions_normative_tec, default: false #hnical_manuals
      t.boolean  :acceptable_solutions_interstate_standards, default: false
      t.boolean  :acceptable_solutions_standards, default: false
      t.boolean  :effective_solutions_special_technical_conditions, default: false
      t.boolean  :effective_solutions_test_reports, default: false
      t.boolean  :effective_solutions_organization_standards, default: false
      t.boolean  :by_types_of_buildings, default: false
      t.boolean  :general_requirements, default: false
      t.boolean  :public_buildings_schools, default: false
      t.boolean  :public_buildings_medical_institutions, default: false
      t.boolean  :public_buildings_organizations_of_preschool_education_and_train, default: false #ing
      t.boolean  :public_buildings_athletic_facilities, default: false
      t.boolean  :public_buildings_administrative_and_service_buildings, default: false
      t.boolean  :industrial_buildings_agricultural_enterprises, default: false
      t.boolean  :buildings_of_individual_housing_construction, default: false
      t.boolean  :residential_buildings, default: false
      t.boolean  :by_scope, default: false
      t.boolean  :general_provisions, default: false
      t.boolean  :construction_site_and_master_plan_specialized_sites_parking_lot, default: false #s_driveways
      t.boolean  :construction_site_and_master_plan_ancillary_buildings, default: false
      t.boolean  :architectural_planning_solutions_functionality, default: false
      t.boolean  :architectural_planning_solutions_space_planning_solutions, default: false
      t.boolean  :architectural_planning_solutions_mgn, default: false
      t.boolean  :design_solutions_reinforced_concrete_structures, default: false
      t.boolean  :design_solutions_metal_structures, default: false
      t.boolean  :design_solutions_seismic, default: false
      t.boolean  :design_solutions_structural_analysis, default: false
      t.boolean  :security_requirements_reliability_of_structures, default: false
      t.boolean  :security_requirements_fire_prevention, default: false
      t.boolean  :security_requirements_evacuation_in_case_of_fires_and_other_eme, default: false #rgencies
      t.boolean  :security_requirements_antiterrorist_activities, default: false
      t.boolean  :sanitary_and_hygiene_requirements_vygiene, default: false
      t.boolean  :sanitary_and_hygiene_requirements_noise_vibration, default: false
      t.boolean  :sanitary_and_hygiene_requirements_varmful_radiation, default: false
      t.boolean  :engineering_systems_veating_and_ventilation, default: false
      t.boolean  :engineering_systems_water_supply_and_sewerage, default: false
      t.boolean  :engineering_systems_electrical, default: false
      t.boolean  :energy_saving_and_environmental_protection_ensuring_environment, default: false #al_protection
      t.boolean  :energy_saving_and_environmental_protection_reducing_energy_cons, default: false #umption
      t.boolean  :energy_saving_and_environmental_protection_rational_use_of_natu, default: false #ral_resources
      t.boolean  :according_to_the_stage_of_the_life_cycle_of_a_building, default: false
      t.boolean  :project, default: false
      t.boolean  :requirements_for_construction_documentation, default: false
      t.boolean  :construction, default: false
      t.boolean  :exploitation, default: false

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
