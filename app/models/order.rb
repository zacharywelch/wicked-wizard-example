class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  after_save :activate_order

  validates :company, :name, :address, presence: true, :if => :customer_step?
  validates :sales_rep, presence: true, :if => :cart_step?
  validates :line_items, presence: true, :if => :cart_step?

  def active?
    status == 'active'
  end

  private

  def customer_step?
    status == 'customer' || active?
  end

  def cart_step?
    status == 'cart' || active?
  end

  def activate_order
    Contract.activate(self) if status_changed? && active?
  end
end
