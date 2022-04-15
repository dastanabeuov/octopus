class Agsk < ApplicationRecord

  enum filter: { 'Без фильтра': 0,
                 'формализуемый': 1,
                 'не формализуемый': 2,
                 'ссылочная': 3,
                 'По иерархии': 4,

                 'Законодательный уровень | Кодексы': 5,
                 'Законодательный уровень | Законы': 6,
                 
                 'Производный уровень | Тех.регламенты': 7,
                 'Производный уровень | Правила': 8,
                 'Производный уровень | Санитарные правила': 9,

                 'Результативные требования | Межгосударственные строительные нормы (МСН)': 10,
                 'Результативные требования | Строительные нормы (СН)': 11,
                 'Результативные требования | Руководящие документы в строительстве (РДС)': 12,

                 'Приемлемые решения Межгосударственные Своды правил (МСП)': 13,
                 'Приемлемые решения Своды правил (СП)': 14,
                 'Приемлемые решения Рекомендации, инструкции, Нормативно технические пособия (НТП)': 15,
                 'Приемлемые решения Межгосударственные стандарты (СТ)': 16,
                 'Приемлемые решения Стандарты (СТ)': 17,

                 'Результативные решения | Специальные технические условия (СТУ)': 18,
                 'Результативные решения | Отчеты об испытаниях ': 19,
                 'Результативные решения | Стандарты организаций (СО)': 20,

                 'По видам зданий': 21,
                 'Общие требования': 22,

                 'Общественные здания | Школы': 23,
                 'Общественные здания | Лечебно-профилактические учреждения': 24,
                 'Общественные здания | Организации дошкольного воспитания и обучения': 25,
                 'Общественные здания | Спортивные сооружения': 26,
                 'Общественные здания | Административные и бытовые здания': 27,

                 'Промышленные здания | Сельскохозяйственные предприятия': 28,
                 'Здания индивидуального жилищного строительства': 29,
                 'Жилые здания': 30,
                 'По сфере применения': 31,
                 'Общие положения': 32,
                 
                 'Участок строительства и генеральный план | Специализированные площадки, стоянки, проезды': 33,
                 'Участок строительства и генеральный план | Вспомогательные здания': 34,

                 'Архитектурно-планировочные решения | Функциональность': 35,
                 'Архитектурно-планировочные решения | Объемно-планировочные решения': 36,
                 'Архитектурно-планировочные решения | МГН': 37,

                 'Конструктивные решения | Конструкции железобетонные (КЖ)': 38,
                 'Конструктивные решения | Конструкции металлические (КЖ)': 39,
                 'Конструктивные решения | Сейсмика': 40,
                 'Конструктивные решения | Расчет конструкций': 41,

                 'Требования к безопасности | Надежность конструкций': 42,
                 'Требования к безопасности | Предотвращение пожара': 43,
                 'Требования к безопасности | Эвакуация при пожарах и других ЧС': 44,
                 'Требования к безопасности | Антитеррористические мероприятия': 45,

                 'Санитарно-гигиенические требования | Гигиена': 46,
                 'Санитарно-гигиенические требования | Шум, вибрация': 47,
                 'Санитарно-гигиенические требования | Вредные излучения': 48,

                 'Инженерные системы | Отопление и вентиляция (ОВ)': 49,
                 'Инженерные системы | Водоснабжение и канализация (ВК)': 50,
                 'Инженерные системы | Электрика (ЭЛ)': 51,

                 'Энергосбережение и охрана окружающей среды | Обеспечение охраны окружающей среды': 52,
                 'Энергосбережение и охрана окружающей среды | Сокращение энергопотребления': 53,
                 'Энергосбережение и охрана окружающей среды | Рациональное использование природных ресурсов': 54,

                 'По стадии жизненного цикла здания': 55,
                 'Проект': 56,
                 'Требования к строительной документации': 57,
                 'Строительство': 58,
                 'Эксплуатация': 59 } # , _suffix: :status
  
  before_save :replace_nil_values

  belongs_to :user

  validates :requirement, presence: true, uniqueness: true

  #imported data agsks
  def self.start_import(file, user)
    ImportForAgsk.new(file, user).import
  end

  def replace_nil_values
    self.without_a_filter = false if without_a_filter == nil
    self.formalizable = false if formalizable == nil
    self.not_formalized = false if not_formalized == nil
    self.reference = false if reference == nil
    self.by_hierarchy = false if by_hierarchy == nil
    self.legislative_level_codes = false if legislative_level_codes == nil
    self.legislative_level_the_laws = false if legislative_level_the_laws == nil
    self.derived_level_technical_regulations = false if derived_level_technical_regulations == nil
    self.derived_level_rules = false if derived_level_rules == nil
    self.derived_level_sanitary_regulations = false if derived_level_sanitary_regulations == nil
    self.performance_requirements_interstate_building_codes = false if performance_requirements_interstate_building_codes == nil
    self.performance_requirements_building_codes = false if performance_requirements_building_codes == nil
    self.performance_requirements_guiding_documents_in_construction = false if performance_requirements_guiding_documents_in_construction == nil
    self.acceptable_solutions_interstate_codes_of_practice = false if acceptable_solutions_interstate_codes_of_practice == nil
    self.acceptable_code_of_practice_solutions = false if acceptable_code_of_practice_solutions == nil
    self.acceptable_solutions_recommendations_instructions_normative_tec = false if acceptable_solutions_recommendations_instructions_normative_tec == nil #hnical_manuals
    self.acceptable_solutions_interstate_standards = false if acceptable_solutions_interstate_standards == nil
    self.acceptable_solutions_standards = false if acceptable_solutions_standards == nil
    self.effective_solutions_special_technical_conditions = false if effective_solutions_special_technical_conditions == nil
    self.effective_solutions_test_reports = false if effective_solutions_test_reports == nil
    self.effective_solutions_organization_standards = false if effective_solutions_organization_standards == nil
    self.by_types_of_buildings = false if by_types_of_buildings == nil
    self.general_requirements = false if general_requirements == nil
    self.public_buildings_schools = false if public_buildings_schools == nil
    self.public_buildings_medical_institutions = false if public_buildings_medical_institutions == nil
    self.public_buildings_organizations_of_preschool_education_and_train = false if public_buildings_organizations_of_preschool_education_and_train == nil #ing
    self.public_buildings_athletic_facilities = false if public_buildings_athletic_facilities == nil
    self.public_buildings_administrative_and_service_buildings = false if public_buildings_administrative_and_service_buildings == nil
    self.industrial_buildings_agricultural_enterprises = false if industrial_buildings_agricultural_enterprises == nil
    self.buildings_of_individual_housing_construction = false if buildings_of_individual_housing_construction == nil
    self.residential_buildings = false if residential_buildings == nil
    self.by_scope = false if by_scope == nil
    self.general_provisions = false if general_provisions == nil
    self.construction_site_and_master_plan_specialized_sites_parking_lot = false if construction_site_and_master_plan_specialized_sites_parking_lot == nil #s_driveways
    self.construction_site_and_master_plan_ancillary_buildings = false if construction_site_and_master_plan_ancillary_buildings == nil
    self.architectural_planning_solutions_functionality = false if architectural_planning_solutions_functionality == nil
    self.architectural_planning_solutions_space_planning_solutions = false if architectural_planning_solutions_space_planning_solutions == nil
    self.architectural_planning_solutions_mgn = false if architectural_planning_solutions_mgn == nil
    self.design_solutions_reinforced_concrete_structures = false if design_solutions_reinforced_concrete_structures == nil
    self.design_solutions_metal_structures = false if design_solutions_metal_structures == nil
    self.design_solutions_seismic = false if design_solutions_seismic == nil
    self.design_solutions_structural_analysis = false if design_solutions_structural_analysis == nil
    self.security_requirements_reliability_of_structures = false if security_requirements_reliability_of_structures == nil
    self.security_requirements_fire_prevention = false if security_requirements_fire_prevention == nil
    self.security_requirements_evacuation_in_case_of_fires_and_other_eme = false if security_requirements_evacuation_in_case_of_fires_and_other_eme == nil #rgencies
    self.security_requirements_antiterrorist_activities = false if security_requirements_antiterrorist_activities == nil
    self.sanitary_and_hygiene_requirements_vygiene = false if sanitary_and_hygiene_requirements_vygiene == nil
    self.sanitary_and_hygiene_requirements_noise_vibration = false if sanitary_and_hygiene_requirements_noise_vibration == nil
    self.sanitary_and_hygiene_requirements_varmful_radiation = false if sanitary_and_hygiene_requirements_varmful_radiation == nil
    self.engineering_systems_veating_and_ventilation = false if engineering_systems_veating_and_ventilation == nil
    self.engineering_systems_water_supply_and_sewerage = false if engineering_systems_water_supply_and_sewerage == nil
    self.engineering_systems_electrical = false if engineering_systems_electrical == nil
    self.energy_saving_and_environmental_protection_ensuring_environment = false if energy_saving_and_environmental_protection_ensuring_environment == nil #al_protection
    self.energy_saving_and_environmental_protection_reducing_energy_cons = false if energy_saving_and_environmental_protection_reducing_energy_cons == nil #umption
    self.energy_saving_and_environmental_protection_rational_use_of_natu = false if energy_saving_and_environmental_protection_rational_use_of_natu == nil #ral_resources
    self.according_to_the_stage_of_the_life_cycle_of_a_building = false if according_to_the_stage_of_the_life_cycle_of_a_building == nil
    self.project = false if project == nil
    self.requirements_for_construction_documentation = false if requirements_for_construction_documentation == nil
    self.construction = false if construction == nil
    self.exploitation = false if exploitation == nil

    # self.attributes.each do |attr|
    #   self.attr = false if attr == nil
    # end
  end
end
