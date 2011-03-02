class Company < ActiveRecord::Base
  has_many :locations, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy
  has_many :deals, :dependent => :destroy

  validates :domain, :length => {:minimum => 4},
                     :presence => true,
                     :uniqueness => true

  validates :name, :length => {:minimum => 3},
                   :presence => true,
                   :uniqueness => true

  acts_as_taggable_on :tags
end
