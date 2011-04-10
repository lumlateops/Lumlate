class Deal < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :company
  belongs_to :subscription
  belongs_to :deal_type
  has_many :emails

  validates_associated :company
  validates_associated :deal_type
  validates :title, :presence => true

  acts_as_taggable_on :tags

  scope :by_max_value, order('maxvalue DESC')
  scope :by_min_value, order('maxvalue ASC')
  scope :by_expiry_date, order('expiry ASC')
  scope :with_expiry_date, lambda { |expiry_date| where("expiry >= ? AND expiry <= ?", expiry_date.midnight, expiry_date.midnight + 1.day) }

  def slug
    title.parameterize()
  end

  def to_label
    title
  end

  def time_left
    expiry
  end
end

