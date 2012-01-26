module Metadown
  class MetadataParser
    def initialize(text)
      @text = text
      @metadata = {}
    end

    def parse
      @text =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      @mtext = YAML.load($1) if $1
    end
  end
end
