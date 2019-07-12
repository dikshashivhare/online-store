class Product < ApplicationRecord
	belongs_to :user, optional: true
	mount_uploader :image, ImageUploader

	def self.search(search,search1)
		
		if search.present? && search1.present?
			where("name like ? OR category like ?", "%#{search}%","%#{search1}%")
		elsif search.present?
			where("name like ? ", "%#{search}%")
		elsif search1.present?
			where("category like ? ", "%#{search1}%")
		else
			products = Product.all
		end
	end
end

