class Product < ApplicationRecord
    belongs_to:category
    has_many:has_products
    has_many:stores,through: :has_products, dependent: :destroy

    attr_accessor :store_elements

    def save_stores
        puts store_elements, "has stores"
        return has_products.destroy_all if store_elements.nil? || store_elements.empty? 

        has_products.where.not(store_id: store_elements).destroy_all
        store_elements.each do |store_id|
            HasProduct.find_or_create_by(product:self,store_id: store_id)
        end
    end
end
