class Item
  include Mongoid::Document
  field :quantity, :type => Integer
  field :type, :type => String
  field :description, :type => String
  field :price, :type => Float
  # field :tax_id, :type => Integer

  validates_presence_of :description
  validates_presence_of :price
  validates_numericality_of :price
  
  embedded_in :invoice
  
  def total
    price * quantity
  end
  
end