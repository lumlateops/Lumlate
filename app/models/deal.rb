class Deal < ActiveRecord::Base
  belongs_to :company
  belongs_to :subscription
  belongs_to :deal_type
  has_many :emails
  has_and_belongs_to_many :users

  validates_associated :company
  validates_associated :deal_type

  validates :external_id, :presence => true,
                 :uniqueness => true

  validates :title, :presence => true
  
end
