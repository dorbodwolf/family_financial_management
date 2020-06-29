class ExpensesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_expense, only: %i(show edit update destroy)
    
    def new
        @expense = Expense.new
    end

    def show
    end
    
    def edit
      
    end

    def create
        if current_user.expenses.create(expense_params)
          redirect_to incomes_path, notice: "新增成功！"
        else
          render :back
        end
    end

    def update
      if @expense.update(expense_params)
        redirect_to incomes_path, notice: "编辑成功！"
      else
        render :back
      end
    end

    def destroy
      if @expense.destroy
        redirect_to incomes_path, notice: "删除成功！"
      else
        redirect_to incomes_path, notice: "删除失败！"
      end
    end

    def expense_params
        params.require(:expense).permit(:expense_type, :subtype, :detailtype, :value, :marks, :credit_day)
    end  

    def find_expense
      @expense = current_user.expenses.find(params[:id])
    end
end
