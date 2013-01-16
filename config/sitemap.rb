# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://quoty.me"
SitemapGenerator::Sitemap.create do
  add quotes_path, priority: 0.7, changefreq: 'daily'

  # languages
  %w(english japanese chinese).each do |language|
    add language_path(language), changefreq: 'daily'
  end

  # quotes
  Quote.find_each do |quote|
    add quote_path(quote), lastmod: quote.updated_at
  end

  # users
  User.find_each do |user|
    add user_path(user)
  end

  # static pages
  add '/about'
end
