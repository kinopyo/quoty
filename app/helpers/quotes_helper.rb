module QuotesHelper
  def show_product_tagline?
    current_page?(root_path) && !signed_in?
  end

  def quotes_list_title(quotes)
    # Somehow this line below doesn't work in popular quotes page
    # if current_page?(controller: 'quotes', action: 'language')
    if params[:controller] == 'quotes' && params[:action] == 'language'
      "#{quotes.first.language_in_its_own} Quote"
    elsif current_page?(popular_quotes_path)
      "Popular Quotes"
    elsif current_page?(my_quotes_path)
      "My Posted Quotes"
    elsif current_page?(likes_quotes_path)
      "My Liked Quotes"
    elsif current_page?(root_path || quotes_path)
      "Recent Quotes"
    end
  end

  def nav_link(*args, &block)
    if block_given?
      options      = args.first || {}
      html_options = args.second
      nav_link(capture(&block), options, html_options)
    else
      name         = args[0]
      options      = args[1] || {}
      html_options = args[2]

      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_for(options)

      class_name = current_page?(url) ? 'active' : nil

      href = html_options['href']

      href_attr = "href=\"#{ERB::Util.html_escape(url)}\"" unless href
      "<a #{href_attr} class='#{class_name} list-group-item'>#{ERB::Util.html_escape(name || url)}</a>".html_safe
    end
  end
end
