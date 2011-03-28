class SubscriptionStatus < ActiveRecord::Base
  has_many :user_subscriptions
end
