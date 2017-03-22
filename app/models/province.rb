class Province < ApplicationRecord
  validates :name, :pst, :gst, presence: true
  validates :name, uniqueness: true
  validates :pst, :gst, :hst, numericality: true
end
