class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy approve reject]

  def index
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
    @expense.expense_type = params[:type].downcase.to_sym if params[:type].in?(%w[regular travel])
  end
  

  def create
    @expense = current_user.expenses.new(expense_params)
    @expense.expense_type = params[:type].classify if params[:type].in?(%w[regular travel])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expense_url(@expense), notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  def approve
    @expense.approve!
    redirect_to @expense, notice: 'Expense was successfully approved.'
  end

  def reject
    @expense.reject! #if rejected by SA OR AD
    redirect_to @expense, notice: 'Expense was rejected.'
  end


  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    permitted_params = [:description, :amount, :date] 
    permitted_params += [:start_date, :end_date, :source, :destination, :mode_of_transport] if @expense.is_travel?
    params.require(:expense).permit(permitted_params)
  end
end
