class Subscription < ActiveRecord::Base
  belongs_to :company
  
  has_many :users, :through => :user_subscriptions
  has_many :user_subscriptions
  
  belongs_to :subscription_type
  has_many :emails
  has_many :deals

  validates_associated :company
  validates_associated :subscription_type

  validates :url, :presence => true

  acts_as_taggable_on :tags

  after_initialize :init

  def init
   if self.company
    self.domain ||= self.company.domain
    self.tag_list ||= self.company.tag_list
    self.title ||= self.company.name
   end
   self.email_domain ||= domain
  end

  def slug
    title.parameterize()
  end

  def to_label
    title
  end
end
