class UserSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  belongs_to :subscripton_status

  validates :user, :presence => true
  validates :subscription, :presence => true
  validates :subscription_status, :presence => true

end
