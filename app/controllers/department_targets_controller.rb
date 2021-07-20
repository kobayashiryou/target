class DepartmentTargetsController < ApplicationController
  before_action :set_department_target, only: %i[show edit update destroy]

  # GET /department_targets or /department_targets.json
  def index
    @department_targets = DepartmentTarget.all
  end

  # GET /department_targets/1 or /department_targets/1.json
  def show
  end

  # GET /department_targets/new
  def new
    @department_target = DepartmentTarget.new
  end

  # GET /department_targets/1/edit
  def edit
  end

  # POST /department_targets or /department_targets.json
  def create
    @department_target = DepartmentTarget.new(department_target_params)

    respond_to do |format|
      if @department_target.save
        format.html { redirect_to @department_target, notice: "Department target was successfully created." }
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
        format.html { redirect_to @department_target, notice: "Department target was successfully updated." }
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
      format.html { redirect_to department_targets_url, notice: "Department target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_department_target
      @department_target = DepartmentTarget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_target_params
      params.require(:department_target).permit(:monthly_target, :anually_target, :department_id)
    end
end