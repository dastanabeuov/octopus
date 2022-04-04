class DigitizationAgsksController < ApplicationController
  before_action :set_digitization_agsk, only: %i[ show edit update destroy ]

  # GET /digitization_agsks or /digitization_agsks.json
  def index
    @digitization_agsks = DigitizationAgsk.all
  end

  # GET /digitization_agsks/1 or /digitization_agsks/1.json
  def show
  end

  # GET /digitization_agsks/new
  def new
    @digitization_agsk = DigitizationAgsk.new
  end

  # GET /digitization_agsks/1/edit
  def edit
  end

  # POST /digitization_agsks or /digitization_agsks.json
  def create
    @digitization_agsk = DigitizationAgsk.new(digitization_agsk_params)

    respond_to do |format|
      if @digitization_agsk.save
        format.html { redirect_to digitization_agsk_url(@digitization_agsk), notice: "Digitization agsk was successfully created." }
        format.json { render :show, status: :created, location: @digitization_agsk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @digitization_agsk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /digitization_agsks/1 or /digitization_agsks/1.json
  def update
    respond_to do |format|
      if @digitization_agsk.update(digitization_agsk_params)
        format.html { redirect_to digitization_agsk_url(@digitization_agsk), notice: "Digitization agsk was successfully updated." }
        format.json { render :show, status: :ok, location: @digitization_agsk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @digitization_agsk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digitization_agsks/1 or /digitization_agsks/1.json
  def destroy
    @digitization_agsk.destroy

    respond_to do |format|
      format.html { redirect_to digitization_agsks_url, notice: "Digitization agsk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digitization_agsk
      @digitization_agsk = DigitizationAgsk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def digitization_agsk_params
      params.require(:digitization_agsk).permit(:requirement, :concept, :descriptor, :formalizability, :user_id)
    end
end
