class Shared::PostCard < Bridgetown::Component
  def initialize(post:)
    @post = post
  end

  def date = @post.date
  def title = @post.data.title
  def categories = Array(@post.data.categories)

  def excerpt
    text = @post.data.description.to_s
    text = helpers.strip_html(@post.content.to_s) if text.strip.empty?
    text = text.gsub(/\s+/, " ").strip
    return text if text.length <= 160

    "#{text[0, 160].sub(/\s+\S*\z/, "")}…"
  end
end
