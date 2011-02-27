class Email < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  belongs_to :deal

  validates_associated :user

  validates :id, :presence => true,
                 :uniqueness => true

  validates :sent, :presence => true,
                 :uniqueness => true

  validates :from, :presence => true,
                 :uniqueness => true

  validates :to, :presence => true,
                 :uniqueness => true
               
  validates :type, :presence => true,
                   :uniqueness => true


end
