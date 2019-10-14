class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true }, presence: true
  validate :validate_apparel

  def validate_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "Need some clothes!")
    end
  end

end
