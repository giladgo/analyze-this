class CategoriesController < ApplicationController

  def index
    categories = Category.all

    respond_to do |format|
      format.json {render json: categories}
    end
  end

  private

  def current_user
    # TODO: fetch user by id passed in header
    User.first
  end

end
