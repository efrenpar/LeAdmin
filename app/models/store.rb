class Store < ApplicationRecord
    has_many:has_products
    has_many:products,through: :has_products, dependent: :destroy

    attr_accessor :product_elements

    def save_products
        puts product_elements, "has Products"
        return has_products.destroy_all if product_elements.nil? || product_elements.empty? 

        has_products.where.not(product_id: product_elements).destroy_all
        product_elements.each do |product_id|
            HasProduct.find_or_create_by(store:self,product_id: product_id)
        end
    end

end
