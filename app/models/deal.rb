class Deal < ActiveRecord::Base
  belongs_to :company
  belongs_to :subscription
  has_many :emails
  has_and_belongs_to_many :users

  validates_associated :company

  validates :id, :presence => true,
                 :uniqueness => true

  validates :title, :presence => true

  validates :type, :presence => true
  
end
