class Deal < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :company
  belongs_to :subscription
  belongs_to :deal_type
  has_many :emails
  has_many :votes

  validates_associated :company
  validates_associated :deal_type
  validates :title, :presence => true

  acts_as_taggable_on :tags

  def recalc
    update_attribute(:rating, votes.average(:rating).to_i)
  end

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

