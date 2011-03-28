class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deal_email_type = EmailType.find_by_name("Deal");
    @deal_emails = current_user.emails.paginate :page => params[:page],
                      :order => '"from" DESC',
                      :conditions => {:email_type_id => @deal_email_type.id}
    
    respond_to do |format|
      format.html {render :layout => !request.xhr?}
      format.json  { render :json => @deals }
    end
  end
end
