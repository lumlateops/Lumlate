class Email < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  belongs_to :deal
  belongs_to :email_type

  validates_associated :user
  validates_associated :email_type

  validates :external_id, :presence => true,
                 :uniqueness => true

  validates :sent, :presence => true

  validates :from, :presence => true

  validates :to, :presence => true

  def to_label
    subject
  end
end
