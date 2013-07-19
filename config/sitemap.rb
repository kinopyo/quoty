require Rails.root.join 'lib/sitemap_generator/sftp_adapter'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://quoty.me"
SitemapGenerator::Sitemap.sitemaps_host = "http://cdn.kinopyo.com/"
SitemapGenerator::Sitemap.public_path = 'tmp/'  # to make it work on Heroku
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::SftpAdapter.new

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

  Author.find_each do |author|
    add author_path(author), lastmod: author.updated_at
  end

  # static pages
  add '/about'
end
