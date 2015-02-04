class Product < ActiveRecord::Base
	validates :name, :description, :pricing, presence: true
end
