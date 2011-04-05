class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_account

  private
    def set_current_account
      @current_account = Account.find_by_subdomain!(request.subdomains.first)
    end
end
