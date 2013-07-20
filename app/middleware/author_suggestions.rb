class AuthorSuggestions
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/authors/search'
      request = Rack::Request.new(env)
      authors = Author.search(request.params['query'])
      [200, {"Content-Type" => "appication/json"}, [authors.to_json]]
    else
      @app.call(env)
    end
  end
end
