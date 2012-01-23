require "metadown/renderer"
require "metadown/version"

# This module namespaces everything in the gem. It's also where the factory
# #render method lives.
module Metadown

  # This struct is what gets returned from a call to #render.
  # 
  # It has two attributes, one for the metadata, and one for the rendered
  # output.
  Data = Struct.new(:metadata, :output)

  # The render method is a convenient factory. It parses some text via our
  # Renderer class and Redcarpet's own class, and gives us a Data back.
  def render(text)
    renderer = Metadown::Renderer.new
    markdown = Redcarpet::Markdown.new(renderer)
    output = markdown.render(text)
    Data.new(renderer.metadata, output)
  end
  module_function :render
end
