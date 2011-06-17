class Contact
  include Mongoid::Document
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :phone, :type => String
  
  embedded_in :client
end