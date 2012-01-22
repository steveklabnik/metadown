$:.unshift("lib")
require 'metadown'

describe Metadown do
  it "provides a factory" do
    text = <<-MARKDOWN
---
key: "value"
---
hello world
MARKDOWN

    Metadown.render(text).tap do |data|
      data.should be_kind_of(Metadown::Data)
      data.metadata.should eql({"key" => "value"})
      data.output.should eql("<p>hello world</p>\n")
    end
  end
end
