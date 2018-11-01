require "metadown/renderer"
require "metadown/metadata_parser"
require "metadown/version"

# This module namespaces everything in the gem. It's also where the factory
# #render method lives.
module Metadown
  # This struct is what gets returned from a call to #render.
  #
  # It has two attributes, one for the metadata, and one for the rendered
  # output.
  Data = Struct.new(:metadata, :output)

  # The render method is a convenient factory. If we give it text, it
  # delegates to the classic markdown renderer, otherwise, we can inject
  # one of our own.
  def render(text, renderer = nil)
    return redcarpet_render(text) if renderer.nil?

    parser = MetadataParser.new(text)

    Data.new(parser.metadata, renderer.render(parser.text))
  end
  module_function :render

  # Classic compatiblity mode: fall back to old redcarpet renderer
  def redcarpet_render(text)
    renderer = Renderer.new
    markdown = Redcarpet::Markdown.new(renderer)

    output = markdown.render(text)

    Data.new(renderer.metadata, output)
  end
  module_function :redcarpet_render
end
