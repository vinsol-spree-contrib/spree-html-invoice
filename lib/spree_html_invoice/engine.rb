module Spree::HtmlInvoice; end

module SpreeHtmlInvoice
  class Engine < Rails::Engine

    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_html_invoice'
    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_html_invoice.assets.precompile", after: "spree.assets.precompile" do |app|
      app.config.assets.precompile += [ "admin/html-invoice.css", "admin/html-receipt.css" ]
    end

    initializer "spree.spree_html_invoice.preferences", before: :load_config_initializers, after: "spree.environment" do |app|
      Spree::HtmlInvoice::Config = Spree::HtmlInvoiceConfiguration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../../app/overrides/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
