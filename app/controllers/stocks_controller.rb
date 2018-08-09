class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash[:danger] = 'You have entered empty search string.'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash[:danger] = 'You have entered incorrect symbol.' unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end   
  end
end
