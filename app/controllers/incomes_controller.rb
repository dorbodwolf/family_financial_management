class IncomesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_income, only: %i(show edit update destroy)
  
  
    def show
    end

    def index
      @incomes = Income.order(:id)
      @users = User.all
      @income_types = IncomeType.all

      # 当月的总收入
      @total_income_current_month = Income.where(credit_day: Date.today.at_beginning_of_month..Date.today.at_end_of_month).sum(:value)
      # 当月的总支出
      @total_expense_current_month = Expense.where(credit_day: Date.today.at_beginning_of_month..Date.today.at_end_of_month).sum(:value)
      # 当月活动现金流
      @accessible_month = @total_income_current_month - @total_expense_current_month
      # 年度总收入
      @total_income_year = Income.where(credit_day: Date.today.at_beginning_of_year..Date.today.at_end_of_year).sum(:value)
      # 年度总支出
      @total_expense_year = Expense.where(credit_day: Date.today.at_beginning_of_year..Date.today.at_end_of_year).sum(:value)
      # 本年现金流
      @accessible_year = @total_income_year - @total_expense_year
      # 历史总收入
      @total_income = Income.sum(:value)
      # 历史总支出
      @total_expense = Expense.sum(:value)
      # 历史存款
      @accessible = @total_income - @total_expense

      # @expenses = Expense.order(:id)

      @search = ExpenseSearch.new(params[:search])
      @selected_expenses = @search.scope
    end
  
    def new
      @income = Income.new
    end
  
    def create
      if current_user.incomes.create(income_params)
        redirect_to incomes_path, notice: "新增成功！"
      else
        render :back
      end
    end
  
    def edit
    end
  
    def update
      if @income.update(income_params)
        redirect_to incomes_path, notice: "编辑成功！"
      else
        render :back
      end
    end
  
    def destroy
      if @income.destroy
        redirect_to incomes_path, notice: "删除成功！"
      else
        redirect_to incomes_path, notice: "删除失败！"
      end
    end
  
    private
  
    def income_params
      params.require(:income).permit(:income_type, :subtype, :value, :detail, :credit_day)
    end
  
    def find_income
      @income = current_user.incomes.find(params[:id])
    end
end
