class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deal_email_type = EmailType.find_by_name("Deal");
    @deal_emails = current_user.deal_emails_by_expiry_date.
      paginate(:page => params[:page], :per_page => 10)

    # Sorting companies by deals count and define top 5 and other companies
    user_companies = current_user.deals.map { |s| s.company }.uniq
    companies = Company.sorted_by_max_deal_count(user_companies)
    @top_companies = companies[0..4]
    @top_companies.each { |c| companies.delete(c) }
    @other_companies = companies

    # Define all user's deals tags
    tags = current_user.tags
    @first_ten_tags = tags[0..9]
    @first_ten_tags.each { |c| tags.delete(c) }
    @other_tags = tags

    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render :json => @deals }
      format.js
    end
  end

  def deal_emails_by_max_or_min_value
    # Get deals sorted by max or min value
    if params[:deals_by_value_filter] == 'max'
      @deal_emails = current_user.deal_emails_by_max_value.
        paginate(:page => params[:page], :per_page => 10)
    else
      @deal_emails = current_user.deal_emails_by_min_value.
        paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_by_expiry_date
    # Get deals sorted by expiry date
    @deal_emails = current_user.deal_emails_by_expiry_date.
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_with_last_expiry_date
    # Search deal with expiry date
    @deal_emails = current_user.deal_emails_with_expiry_date(params[:deals_with_expiry_date_filter].to_date).
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_by_companies
    # Search deals with companies
    @deal_emails = current_user.deal_emails_by_companies(params[:deals_by_companies_filter]).
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_with_tags
    # Search deals tagged with following tag list
    @deal_emails = current_user.deal_emails_tagged_with(params[:deals_with_tags_filter]).
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_by_rating
    # Get deals sorted by rating
    @deal_emails = current_user.deal_emails_by_rating.
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end

  def deal_emails_in_value_range
    # Get deals in value range
    @deal_emails = current_user.deal_emails_in_value_range(params[:min_value], params[:max_value]).
      paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
    end
  end
end

