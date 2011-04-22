class Account < ActiveRecord::Base
  validates :subdomain, :presence => true
end

