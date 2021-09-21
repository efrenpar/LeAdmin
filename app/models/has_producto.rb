class HasProducto < ApplicationRecord
  belongs_to :store
  belongs_to :producto
end
