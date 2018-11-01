require "redcarpet"

module Metadown
  # This class is our own flavor of Redcarpet. It grabs out
  # all the metadata before letting the rest of Redcarpet do
  # all the work.
  class Renderer < Redcarpet::Render::HTML
    # This hook is provided to us by Redcarpet. We get access
    # to the whole text before anything else kicks off, which
    # means we can snag out the YAML at the beginning.
    def preprocess(full_document)
      metadata_parser = MetadataParser.new(full_document)
      @metadata = metadata_parser.metadata
      metadata_parser.text
    end

    # This accessor lets us access our metadata after the
    # processing is all done.
    def metadata
      @metadata || {}
    end
  end
end
