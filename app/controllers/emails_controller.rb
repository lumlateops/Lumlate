class EmailsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @emails = current_user.emails.paginate_by_email_type_id 3, :page => params[:page], :order => '"from" DESC'
    respond_to do |format|
      format.html {render :layout => !request.xhr?}
      format.json  { render :json => @deals }
    end
  end
end
