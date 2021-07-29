class Api::V1::TodosController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_todo, only: %i[show edit update destroy]

  # GET /todos or /todos.json
  def index
    @todos = if current_user
               Todo.where(user_id: current_user.id)
             elsif current_department
               Todo.joins(:user).where(user: { department_id: current_department.id })
             else
               Todo.all
             end
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = current_user.todos.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to [:api, :v1, @todo], notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [:api, :v1, @todo], notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:body, :todo_target_id)
    end

    def move_to_signed_in
      unless company_signed_in? || department_signed_in? || user_signed_in?
        # サインインしていないユーザーはログインページが表示される
        redirect_to api_v1_user_session_url
      end
    end
end
