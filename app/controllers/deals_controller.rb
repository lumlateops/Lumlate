class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @emails = current_user.emails.paginate :page => params[:page], :order => '"from" DESC'
    @deals = @emails.map{|item| item.deal}
    respond_to do |format|
      format.html {render :layout => !request.xhr?}
      format.json  { render :json => @deals }
    end
  end
end
