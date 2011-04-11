class DealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deal_email_type = EmailType.find_by_name("Deal");
    @deal_emails = current_user.deal_emails_by_expiry_date.paginate :page => params[:page],
      :order => '"from" DESC',
      :conditions => {:email_type_id => @deal_email_type.id}

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
    end
  end

  def deals_by_max_or_min_value
    # Get deals sorted by max or min value
    if params[:deals_by_value_filter] == 'max'
      @deal_emails = current_user.deal_emails_by_max_value
    else
      @deal_emails = current_user.deal_emails_by_min_value
    end

    respond_to do |format|
      format.js
    end
  end

  def deals_by_expiry_date
    # Get deals sorted by expiry date
    @deal_emails = current_user.deal_emails_by_expiry_date

    respond_to do |format|
      format.js
    end
  end

  def deals_with_last_expiry_date
    Rails.logger.info "----------#{params.inspect}"
    # Search deal with expiry date
    @deal_emails = current_user.deals_with_expiry_date(params[:deals_with_expiry_date_filter])
  end

  def deals_by_companies
    Rails.logger.info "----------#{params.inspect}"
    # Search deals with companies
    @deal_emails = current_user.deals_by_companies(params[:deals_by_companies_filter])
  end

  def deals_with_tags
    Rails.logger.info "----------#{params.inspect}"
    # Search deals tagged with following tag list
    @deal_emails = current_user.deals_tagged_with(params[:deals_with_tags_filter])
  end

  def deals_by_rating
    Rails.logger.info "----------#{params.inspect}"
    # Get deals sorted by rating
    @deal_emails = current_user.deals_by_rating
  end
end

