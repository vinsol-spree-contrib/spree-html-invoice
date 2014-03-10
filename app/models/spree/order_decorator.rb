Spree::Order.class_eval do
  # Array of totals grouped by Adjustment#label. Useful for displaying line item
  # adjustments on an invoice. For example, you can display tax breakout for
  # cases where tax is included in price.
  def line_item_adjustment_totals
    Hash[self.line_item_adjustments.eligible.group_by(&:label).map do |label, adjustments|
      total = adjustments.sum(&:amount)
      [label, Spree::Money.new(total, { currency: currency })]
    end]
  end
end