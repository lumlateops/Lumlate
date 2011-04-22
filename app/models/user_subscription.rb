class UserSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  belongs_to :subscription_status

  validates :user_id, :presence => true
  validates :subscription_id, :presence => true
  validates :subscription_status_id, :presence => true
end

