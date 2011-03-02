class Location < ActiveRecord::Base
  belongs_to :company

  validates_associated :company

  validates :zipcode, :presence => true,
                    :uniqueness => true
  validates :city, :presence => true,
                    :uniqueness => true
  validates :state, :presence => true,
                    :uniqueness => true

  def to_label
    label = city
    label << "," << state
    label
  end
end
