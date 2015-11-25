class CheckoutsController < ApplicationController
  include Wicked::Wizard
  steps :customer, :cart, :review

  def show
    @order = Order.find(params[:order_id])
    render_wizard
  end

  def update
    @order = Order.find(params[:order_id])
    params[:order][:status] = step.to_s
    params[:order][:status] = 'active' if step == steps.last
    @order.update_attributes(order_params)
    render_wizard @order
  end

  def create
    @order = Order.create
    redirect_to wizard_path(steps.first, order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit(:company, :name, :address, :sales_rep, :status)
  end
end
