class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_account, only: %i(show edit update destroy)

  def index
    @accounts = Account.recent
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    if current_user.accounts.create(account_params)
      redirect_to accounts_path, notice: "新增成功！"
    else
      render :back
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: "编辑成功！"
    else
      render :back
    end
  end

  def destroy
    if @account.destroy
      redirect_to accounts_path, notice: "删除成功！"
    else
      redirect_to accounts_path, notice: "删除失败！"
    end
  end

  private

  def account_params
    params.require(:account).permit(:general_income, :other_income)
  end

  def find_account
    @account = current_user.accounts.find(params[:id])
  end
end
