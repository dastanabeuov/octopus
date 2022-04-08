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
      @search.result(distinct: user_wants_distinct_results?)
    end

    def user_wants_distinct_results?
      params[:distinct].to_i == 1
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_agsk
      @agsk = Agsk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agsk_params
      params.require(:agsk).permit(:requirement, :concept, :descriptor, :formalizability)
    end
end
