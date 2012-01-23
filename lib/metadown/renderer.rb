require 'redcarpet'
require 'yaml'

module Metadown
  class Renderer < Redcarpet::Render::HTML
    def preprocess(full_document)
      full_document =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      @metadata = YAML.load($1) if $1

      $' or full_document
    end

    def metadata
      @metadata || {}
    end
  end
end
