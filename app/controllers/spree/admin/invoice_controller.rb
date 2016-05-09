module Spree
  module Admin
    class InvoiceController < Spree::BaseController
      def lasku
        template = params[:template]
        instance_variable_set('@' + template, true)
        @order = Spree::Order.find_by(number: params[:id])
        render template, layout: false
      end
    end
  end
end
