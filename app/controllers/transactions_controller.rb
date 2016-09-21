class TransactionsController < ApplicationController

  def index
    transactions = current_user.transactions.where(txn_date: 3.months.ago.beginning_of_day..DateTime.now.end_of_day)

    respond_to do |format|
      format.json {render json: transactions.as_json}
    end
  end

  private

  def current_user
    # TODO: fetch user by id passed in header
    User.first
  end

end