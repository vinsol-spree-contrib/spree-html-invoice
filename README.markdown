
Spree-Html-Invoice
=======

This extension provides a "Print Invoice" button on the Admin Orders view screen which opens a printable html page with the order details.

 
INSTALLATION
============

Compatible with spree 2.1 and 2.2 versions.

If you have improvements, please send pull though.

1. To install you need to add the following lines to your Gemfile (no external dependencies)

    gem 'spree_html_invoice' , :git => 'git://github.com/vinsol/spree-html-invoice.git'

2. run bundler

    bundle install

3. Configure your logo and footer text or more. It's easy as it's html.

4. Enjoy!


Configuration
==============

1. Set the logo path preference to include your store / company logo.

    Spree::HtmlInvoice::Config.set(:html_invoice_logo_path => "company-logo.png")
    
    Somewhere in your asset path

2. Override any of the partial templates. they are address, footer, totals, header, thanks , and the line_items. The whole tanks is wrapped in a thanks hook, so replace or add at will.

3. Set Spree::HtmlInvoice::Config.set(:suppress_anonymous_address) option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

4. Enable packaging slips, by setting 

  Spree::HtmlInvoice::Config.set(:print_buttons => "invoice,packaging_slip")  #comma separated list

  Use above feature for your own template if you want. For each button_name, define a subsection with header,   print, and thanks, in your locale.

Contributions welcome
