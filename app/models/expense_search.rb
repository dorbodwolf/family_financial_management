class ExpenseSearch
    attr_reader :date_from, :date_to, :type, :default_date_from, :default_date_to

    def initialize(params)
        params ||= {}
        @default_date_from = Date.today.at_beginning_of_month
        @default_date_to = Date.today.at_end_of_month
        @date_from = params[:date_from]
        @date_to = params[:date_to]
        @type = params[:type]
    end

    def scope
        Expense.where('credit_day BETWEEN ? AND ? AND detailtype LIKE ?' , @date_from, @date_to, "%#{@type}%")
    end

    private

end