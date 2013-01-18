module SitemapGenerator
  class SftpAdapter
    # Call with a SitemapLocation and string data
    def write(location, raw_data)
      SitemapGenerator::FileAdapter.new.write(location, raw_data)

      remote_path = '/var/www/html/cdn/'
      Net::SFTP.start(ENV['REMOTE_SERVER_ADDRESS'], ENV['REMOTE_SERVER_USERNAME'], password: ENV['REMOTE_SERVER_PASSWORD'], port: ENV['REMOTE_SERVER_PORT']) do |sftp|
        sftp.upload!(open(location.path, 'rb'), "#{remote_path}#{location.sitemaps_path}#{location.filename}")
      end
    end
  end
end
