class Email < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :user
  belongs_to :subscription
  belongs_to :deal
  belongs_to :email_type

  validates_associated :user
  validates_associated :email_type

  validates :external_id, :presence => true,
                 :uniqueness => true

  validates :sent, :presence => true
  validates :recieved, :presence => true
  validates :from, :presence => true
  validates :to, :presence => true

  def to_label
    subject
  end
end
