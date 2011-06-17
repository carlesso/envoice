class Invoice
  include Mongoid::Document
  field :user_id, :type => Integer
  field :invoice_id, :type => String
  field :date, :type => Date
  field :client_id, :type => Integer
  
  embeds_many :items
  belongs_to :user
  belongs_to :client
  
  accepts_nested_attributes_for :items, :allow_destroy => true
end