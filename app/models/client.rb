class Client
  include Mongoid::Document
  field :user_id, :type => Integer
  field :company, :type => String
  field :address_line_1, :type => String
  field :address_line_2, :type => String
  field :zip_code, :type => String
  field :city, :type => String
  field :state, :type => String
  field :country, :type => String
  field :tax_id, :type => String
  field :tax_id2, :type => String
  field :notes, :type => String
  
  embeds_many :contacts
  belongs_to :user
  
  accepts_nested_attributes_for :contacts, :allow_destroy => true

  def self.data_for_select
    only(:company, :id).all.collect{|c| [c.company, c.id]} 
  end

end