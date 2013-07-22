module FriendlyIdSlugHelper
  # let friendly_id compatible with Japanese and Chinese
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
