module StoriesHelper
  require "addressable"

  def parse_host(uri_string)
    URI.parse(uri_string).host.delete_prefix("www.")
  end
end
