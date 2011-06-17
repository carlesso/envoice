class Item
  include Mongoid::Document
  field :quantity, :type => Integer
  field :type, :type => String
  field :description, :type => String
  field :price, :type => String
  field :tax_id, :type => Integer
  
  
  embedded_in :invoice
end