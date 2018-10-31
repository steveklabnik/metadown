$:.unshift("lib")
require "metadown"

module CoreExtensions
  module String
    module Heredoc
      def strip_heredoc
        minimum_indent = scan(/^[ \t]*(?=\S)/).min
        indent = minimum_indent && minimum_indent.size || 0
        gsub(/^[ \t]{#{indent}}/, "")
      end
    end
  end
end

String.include CoreExtensions::String::Heredoc
