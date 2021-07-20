class TodoTargetsController < ApplicationController
  before_action :set_todo_target, only: %i[ show edit update destroy ]

  # GET /todo_targets or /todo_targets.json
  def index
    @todo_targets = TodoTarget.all
  end

  # GET /todo_targets/1 or /todo_targets/1.json
  def show
  end

  # GET /todo_targets/new
  def new
    @todo_target = TodoTarget.new
  end

  # GET /todo_targets/1/edit
  def edit
  end

  # POST /todo_targets or /todo_targets.json
  def create
    @todo_target = TodoTarget.new(todo_target_params)

    respond_to do |format|
      if @todo_target.save
        format.html { redirect_to @todo_target, notice: "Todo target was successfully created." }
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
        format.html { redirect_to @todo_target, notice: "Todo target was successfully updated." }
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
      format.html { redirect_to todo_targets_url, notice: "Todo target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_target
      @todo_target = TodoTarget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_target_params
      params.require(:todo_target).permit(:body, :department_id)
    end
end
