class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	
	validates :category, :name, :description, presence: true
	validates :pricing, presence: true, numericality: { greater_than: 0 }
end
