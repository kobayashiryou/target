class Api::V1::CompanyTargetsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_company_target, only: %i[show edit update destroy]
  before_action :authenticate_company!, only: %i[new create edit update destroy]
  # GET /company_targets or /company_targets.json
  def index
    @company_targets = CompanyTarget.all
  end

  # GET /company_targets/1 or /company_targets/1.json
  def show
  end

  # GET /company_targets/new
  def new
    @company_target = current_company.company_targets.new
  end

  # GET /company_targets/1/edit
  def edit
  end

  # POST /company_targets or /company_targets.json
  def create
    @company_target = current_company.company_targets.new(company_target_params)

    respond_to do |format|
      if @company_target.save
        format.html { redirect_to [:api, :v1, @company_target], notice: "Company target was successfully created." }
        format.json { render :show, status: :created, location: @company_target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_targets/1 or /company_targets/1.json
  def update
    respond_to do |format|
      if @company_target.update(company_target_params)
        format.html { redirect_to [:api, :v1, @company_target], notice: "Company target was successfully updated." }
        format.json { render :show, status: :ok, location: @company_target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_targets/1 or /company_targets/1.json
  def destroy
    @company_target.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_company_targets_url, notice: "Company target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_company_target
      @company_target = current_company.company_targets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_target_params
      params.require(:company_target).permit(:monthly_target, :anually_target, :month)
    end

    def move_to_signed_in
      unless company_signed_in? || department_signed_in? || user_signed_in?
        # サインインしていないユーザーはログインページが表示される
        redirect_to api_v1_company_session_url
      end
    end
end
