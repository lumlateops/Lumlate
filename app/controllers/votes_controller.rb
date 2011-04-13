class VotesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    Vote.create(:user_id => current_user, :rating => params[:vote], :deal_id => params[:deal_id])
    Deal.find(params[:deal_id]).recalc
    render :nothing => true
  end
end

