class Shared::Navbar < Bridgetown::Component
  LINKS = [
    { label: "Home", path: "/" },
    { label: "About", path: "/about" },
    { label: "Posts", path: "/posts" },
  ].freeze

  def initialize(metadata:, resource:)
    @metadata, @resource = metadata, resource
  end

  def links = LINKS

  # Mark Home only on the homepage; mark a section for itself and anything under it
  # (so a single post highlights "Posts").
  def current?(path)
    url = @resource.relative_url.to_s.chomp("/")
    url = "/" if url.empty?
    return url == "/" if path == "/"

    url == path || url.start_with?("#{path}/") ||
      (path == "/posts" && @resource.collection&.label == "posts")
  end
end
