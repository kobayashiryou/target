class Api::V1::TodoTargetsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_todo_target, only: %i[edit update destroy]
  before_action :authenticate_department!, only: %i[new create edit update destroy]

  # GET /todo_targets or /todo_targets.json
  def index
    if current_department
      @todo_targets = TodoTarget.where(department_id: current_department.id)
    elsif current_user
      @todo_targets = TodoTarget.where(department_id: current_user.department_id)
    elsif current_company
      @todo_targets = TodoTarget.joins(:department).where(department: { company_id: current_company.id })
    end
  end

  # GET /todo_targets/1 or /todo_targets/1.json
  def show
    @todo_target = if current_department
                     current_department.todo_targets.find(params[:id])
                   else
                     TodoTarget.find(params[:id])
                   end
  end

  # GET /todo_targets/new
  def new
    @todo_target = current_department.todo_targets.new
  end

  # GET /todo_targets/1/edit
  def edit
  end

  # POST /todo_targets or /todo_targets.json
  def create
    @todo_target = current_department.todo_targets.new(todo_target_params)

    respond_to do |format|
      if @todo_target.save
        format.html { redirect_to [:api, :v1, @todo_target], notice: "Todo target was successfully created." }
        format.json { render :show, status: :created, location: @todo_target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_targets/1 or /todo_targets/1.json
  def update
    respond_to do |format|
      if @todo_target.update(todo_target_params)
        format.html { redirect_to [:api, :v1, @todo_target], notice: "Todo target was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_targets/1 or /todo_targets/1.json
  def destroy
    @todo_target.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_todo_targets_url, notice: "Todo target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_todo_target
      @todo_target = current_department.todo_targets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_target_params
      params.require(:todo_target).permit(:body, :department_id)
    end

    def move_to_signed_in
      unless company_signed_in? || department_signed_in? || user_signed_in?
        # サインインしていないユーザーはログインページが表示される
        redirect_to api_v1_department_session_url
      end
    end
end
