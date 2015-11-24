class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :customer, :cart, :review

  def show
    render_wizard
  end
end
