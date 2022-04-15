class AgsksController < ApplicationController
  before_action :set_agsk, only: %i[ show edit update destroy ]

  # GET /agsks or /agsks.json
  def index
    @search = ransack_params
    @agsks  = ransack_result
    
    @pagy, @agsks = pagy(@agsks)

    #@pagy, @agsks = pagy(Agsk.all)
  end

  # GET /agsks/1 or /agsks/1.json
  def show
  end

  # GET /agsks/new
  def new
    @agsk = Agsk.new
  end

  # GET /agsks/1/edit
  def edit
  end

  #import data from table in excel file
  def import
    amount = Agsk.all.count

    @user = current_user
    Agsk.start_import(params[:file], @user)
    redirect_to agsks_path
    
    if Agsk.count > amount
      flash[:notice] = 'Agsk imported.'
    else
      flash[:error] = 'Agsk is not imported.'
    end
  end

  # POST /agsks or /agsks.json
  def create
    @agsk = current_user.agsks.new(agsk_params)

    respond_to do |format|
      if @agsk.save
        format.html { redirect_to agsk_url(@agsk), notice: "Agsk was successfully created." }
        format.json { render :show, status: :created, location: @agsk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agsk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agsks/1 or /agsks/1.json
  def update
    respond_to do |format|
      if current_user.author_of?(@agsk)
        @agsk.update(agsk_params)
        format.html { redirect_to agsk_url(@agsk), notice: "Agsk was successfully updated." }
        format.json { render :show, status: :ok, location: @agsk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agsk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agsks/1 or /agsks/1.json
  def destroy
    @agsk.destroy if current_user.author_of?(@agsk)

    respond_to do |format|
      format.html { redirect_to agsks_url, notice: "Agsk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def ransack_params
      Agsk.ransack(params[:q])
    end

    def ransack_result
      @search.result(distinct: true)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_agsk
      @agsk = Agsk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agsk_params
      params.require(:agsk).permit(
        :requirement, 
        :concept, 
        :descriptor,
        :without_a_filter,
        :formalizable,
        :not_formalized,
        :reference,
        :by_hierarchy,
        :legislative_level_codes,
        :legislative_level_the_laws,
        :derived_level_technical_regulations,
        :derived_level_rules,
        :derived_level_sanitary_regulations,
        :performance_requirements_interstate_building_codes,
        :performance_requirements_building_codes,
        :performance_requirements_guiding_documents_in_construction,
        :acceptable_solutions_interstate_codes_of_practice,
        :acceptable_code_of_practice_solutions,
        :acceptable_solutions_recommendations_instructions_normative_tec,
        :acceptable_solutions_interstate_standards,
        :acceptable_solutions_standards,
        :effective_solutions_special_technical_conditions,
        :effective_solutions_test_reports,
        :effective_solutions_organization_standards,
        :by_types_of_buildings,
        :general_requirements,
        :public_buildings_schools,
        :public_buildings_medical_institutions,
        :public_buildings_organizations_of_preschool_education_and_train,
        :public_buildings_athletic_facilities,
        :public_buildings_administrative_and_service_buildings,
        :industrial_buildings_agricultural_enterprises,
        :buildings_of_individual_housing_construction,
        :residential_buildings,
        :by_scope,
        :general_provisions,
        :construction_site_and_master_plan_specialized_sites_parking_lot,
        :construction_site_and_master_plan_ancillary_buildings,
        :architectural_planning_solutions_functionality,
        :architectural_planning_solutions_space_planning_solutions,
        :architectural_planning_solutions_mgn,
        :design_solutions_reinforced_concrete_structures,
        :design_solutions_metal_structures,
        :design_solutions_seismic,
        :design_solutions_structural_analysis,
        :security_requirements_reliability_of_structures,
        :security_requirements_fire_prevention,
        :security_requirements_evacuation_in_case_of_fires_and_other_eme,
        :security_requirements_antiterrorist_activities,
        :sanitary_and_hygiene_requirements_vygiene,
        :sanitary_and_hygiene_requirements_noise_vibration,
        :sanitary_and_hygiene_requirements_varmful_radiation,
        :engineering_systems_veating_and_ventilation,
        :engineering_systems_water_supply_and_sewerage,
        :engineering_systems_electrical,
        :energy_saving_and_environmental_protection_ensuring_environment,
        :energy_saving_and_environmental_protection_reducing_energy_cons,
        :energy_saving_and_environmental_protection_rational_use_of_natu,
        :according_to_the_stage_of_the_life_cycle_of_a_building,
        :project,
        :requirements_for_construction_documentation,
        :construction,
        :exploitation
        )
    end
end
