$:.unshift("lib")
require "metadown"

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

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
String.send(:include, CoreExtensions::String::Heredoc)
