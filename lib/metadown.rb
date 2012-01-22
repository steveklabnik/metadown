require "metadown/renderer"
require "metadown/version"

module Metadown

  Data = Struct.new(:metadata, :output)

  def render(text)
    renderer = Metadown::Renderer.new
    markdown = Redcarpet::Markdown.new(renderer)
    output = markdown.render(text)
    Data.new(renderer.metadata, output)
  end
  module_function :render
end
