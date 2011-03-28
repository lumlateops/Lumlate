class Subscription < ActiveRecord::Base
  belongs_to :company
  
  has_many :users, :through => :user_subscriptions
  has_many :user_subscriptions
  
  belongs_to :subscription_type
  has_many :emails
  has_many :deals

  validates_associated :company
  validates_associated :subscription_type

  validates :url, :presence => true,
    :uniqueness => true

  validates :title, :presence => true,
    :uniqueness => true

  validates :email_domain, :uniqueness => true
  
  acts_as_taggable_on :tags

  def slug
    title.parameterize()
  end

  def to_label
    title
  end
end
