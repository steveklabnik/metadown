require "redcarpet"
require "yaml"

module Metadown
  # This class is our own flavor of Redcarpet. It grabs out
  # all the metadata before letting the rest of Redcarpet do
  # all the work.
  class Renderer < Redcarpet::Render::HTML
    # This hook is provided to us by Redcarpet. We get access
    # to the whole text before anything else kicks off, which
    # means we can snag out the YAML at the beginning.
    def preprocess(full_document)
      full_document =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      @metadata = YAML.load($1) if $1

      $' || full_document
    end

    # This accessor lets us access our metadata after the
    # processing is all done.
    def metadata
      @metadata || {}
    end
  end
end
