class Subscription < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :users
  belongs_to :subscription_type
  has_many :emails
  has_many :deals, :dependent => :nullify

  validates_associated :company
  validates_associated :subscription_type
  validates :external_id, :presence => true,
    :uniqueness => true
  validates :url, :presence => true,
    :uniqueness => true
  validates :title, :presence => true,
    :uniqueness => true
end
