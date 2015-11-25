class LineItemsController < ApplicationController

  def create
    @order = Order.find(params[:line_item][:order_id])
    @line_item = @order.line_items.create(line_item_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @order = @line_item.order
    @line_item.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    
    def line_item_params
      params.require(:line_item).permit(:order_id, :product_id)
    end
end
