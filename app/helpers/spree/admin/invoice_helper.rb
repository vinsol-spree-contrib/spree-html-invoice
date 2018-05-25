module Spree
  module Admin
    module InvoiceHelper

      def addresses
        bill_address = @order.bill_address
        ship_address = @order.ship_address
        anonymous = @order.email =~ /@example.net$/
        if (anonymous && Spree::HtmlInvoice::Config[:suppress_anonymous_address]) || !bill_address
          all_addresses = [[" "," "]] * 5
        else
          all_addresses = [[ "#{bill_address.firstname} #{bill_address.lastname}", "#{ship_address.firstname} #{ship_address.lastname}"]]
          all_addresses << [bill_address.address1, ship_address.address1]
          unless bill_address.address2.blank? || ship_address.address2.blank? || (bill_address.address2 =~ /\d{3,6}-\d/) || (ship_address.address2 =~ /\d{3,6}-\d/)
            all_addresses << [bill_address.address2, ship_address.address2]
          end
          all_addresses << ["#{bill_address.zipcode} #{bill_address.city}", "#{ship_address.zipcode} #{ship_address.city}"]
          all_addresses << ["#{(bill_address.state.name rescue bill_address.state_name)} #{bill_address.country.name}", "#{(ship_address.state.name rescue ship_address.state_name)} #{ship_address.country.name}"]
          all_addresses << [bill_address.phone, ship_address.phone]
        end
      end

      def show_label(adjustment)
        label =  adjustment.label
        type = ""
        if adjustment.adjustable.is_a?(Spree::Shipment)
          type += Spree.t(:ship_adjustment)
        elsif adjustment.adjustable.is_a?(Spree::LineItem)
          type += adjustment.adjustable.product.name
        end
        type = "(#{type})" unless type.empty?
        label += type
      end
    end
  end
end
