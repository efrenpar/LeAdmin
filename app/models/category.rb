class Category < ApplicationRecord
    #has_rich_text:content, :dependent => :delete_all 
    has_many:products, dependent: :destroy
    has_many :keywords, :dependent => :destroy
end
