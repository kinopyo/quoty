# see https://github.com/rspec/rspec-rails/issues/255#issuecomment-20727452
class ActionDispatch::Routing::RouteSet::NamedRouteCollection::UrlHelper
  def call(t, args)
    t.url_for(handle_positional_args(t, args, { locale: I18n.locale }.merge(@options), @segment_keys))
  end
end
