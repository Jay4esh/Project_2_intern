# app/controllers/expenses_controller.rb
class ExpensesController < ApplicationController
    before_action :set_expense, only: %i[show edit update destroy]
  
    def index
      @expenses = Expense.all
    end
    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
  
    def new
      @expense = Expense.new
    end
  
    def create
      @expense = Expense.new(expense_params)
      @expense.user = current_user # Assuming you have a method to get the current user
  
      if @expense.save
        redirect_to @expense, notice: 'Expense was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_expense
      @expense = Expense.find(params[:id])
    end
  
    def expense_params
      params.require(:expense).permit(:amount, :description, :business_partner_id)
    end
  end
  