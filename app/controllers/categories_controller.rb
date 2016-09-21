class CategoriesController < ApplicationController

  def index
    categories = Category.all

    respond_to do |format|
      format.json {render json: categories}
    end
  end

	def transactions
		transactions = Category.find(params[:id]).transactions
		respond_to do |format|
      format.json {render json: transactions}
    end
	end

  private

  def current_user
    # TODO: fetch user by id passed in header
    User.first
  end

end
