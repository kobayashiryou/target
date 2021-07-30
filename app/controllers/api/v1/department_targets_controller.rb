class Api::V1::DepartmentTargetsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_department_target, only: %i[show edit update destroy]
  before_action :authenticate_department!, only: %i[new create edit update destroy]

  # GET /department_targets or /department_targets.json
  def index
    if current_department
      @department_targets = DepartmentTarget.where(department_id: current_department.id)
    elsif current_user
      @department_targets = DepartmentTarget.where(department_id: current_user.department_id)
    elsif current_company
      @department_targets = DepartmentTarget.joins(:department).where(department: {company_id: current_company.id})
    end
  end

  # GET /department_targets/1 or /department_targets/1.json
  def show
  end

  # GET /department_targets/new
  def new
    @department_target = current_department.department_targets.new
  end

  # GET /department_targets/1/edit
  def edit
  end

  # POST /department_targets or /department_targets.json
  def create
    @department_target = current_department.department_targets.new(department_target_params)

    respond_to do |format|
      if @department_target.save
        format.html { redirect_to [:api, :v1, @department_target], notice: "Department target was successfully created." }
        format.json { render :show, status: :created, location: @department_target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department_targets/1 or /department_targets/1.json
  def update
    respond_to do |format|
      if @department_target.update(department_target_params)
        format.html { redirect_to [:api, :v1, @department_target], notice: "Department target was successfully updated." }
        format.json { render :show, status: :ok, location: @department_target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_targets/1 or /department_targets/1.json
  def destroy
    @department_target.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_department_targets_url, notice: "Department target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_department_target
      @department_target = current_department.department_targets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_target_params
      params.require(:department_target).permit(:monthly_target, :anually_target, :month)
    end

    def move_to_signed_in
      unless company_signed_in? || department_signed_in? || user_signed_in?
        # サインインしていないユーザーはログインページが表示される
        redirect_to api_v1_department_session_url
      end
    end
end
