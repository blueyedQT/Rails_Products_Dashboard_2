class Product < ActiveRecord::Base
	belongs_to :category
	validates :category, :name, :description, :pricing, presence: true
end
