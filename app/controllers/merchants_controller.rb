class MerchantsController < ApplicationController

  def index
    merchants = Merchant.all

    respond_to do |format|
      format.json {render json: merchants}
    end
  end

	def transactions
		transactions = Merchant.find(params[:id]).transactions
		respond_to do |format|
      format.json {render json: transactions}
    end
	end

end
