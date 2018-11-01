require "yaml"

module Metadown
  class MetadataParser
    def initialize(raw_text)
      raw_text =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      @metadata = load_yaml($1) if $1
      @text = $' || raw_text
    end

    attr_reader :metadata, :text

    private

    def load_yaml(raw_yaml)
      if YAML.respond_to?(:safe_load)
        YAML.safe_load(raw_yaml)
      else
        YAML.load(raw_yaml) # rubocop:disable Security/YAMLLoad
      end
    end
  end
end
