class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deals = current_user.deals.paginate :page => params[:page], :order => 'expiry DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @deals }
    end
  end
end
