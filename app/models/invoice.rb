class Invoice
  include Mongoid::Document
  field :user_id, :type => Integer
  field :invoice_id, :type => String
  field :date, :type => Date
  field :client_id, :type => Integer
  field :tax_id, :type => Integer
  field :workflow_state, :type => String
  
  embeds_many :items
  belongs_to :user
  belongs_to :client
  
  accepts_nested_attributes_for :items, :allow_destroy => true

  # Validations
  validates_presence_of :client_id
  # validate :invoice_id_uniqueness_for_user
  
  def validate(record)
    puts record.to_yaml
    errors.add(:invoice_id, "already used in other invoice(s)") if user.invoices.count(:conditions => {:invoice_id => invoice_id}) == 0
  end

  # Workflow
  include Workflow
  workflow do
    state :new do
      event :send, :transitions_to => :sent
      event :pay, :transitions_to => :paid
    end
    state :sent do
      event :pay, :transitions_to => :paid
    end
    state :paid
    state :rejected
  end

  def amount
    items.collect(&:total).sum.to_f
  end
  
  def tax_1
    amount * user.tax_1_percentage / 100
  end
  def tax_2
    amount * user.tax_2_percentage / 100
  end
  def total
    amount + tax_1 + tax_2
  end

end