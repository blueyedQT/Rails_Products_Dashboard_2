class Product < ActiveRecord::Base
	belongs_to :category
	validates :category, :name, :description, presence: true
	validates :pricing, presence: true, numericality: { greater_than: 0 }
end
