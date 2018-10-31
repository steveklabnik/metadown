require "spec_helper"

describe Metadown do
  let(:text) do
    text = <<-MARKDOWN
---
key: "value"
---
hello world
MARKDOWN
  end

  it "provides a factory" do
    Metadown.render(text).tap do |data|
      data.should be_kind_of(Metadown::Data)
      data.metadata.should eql({"key" => "value"})
      data.output.should eql("<p>hello world</p>\n")
    end
  end

  it "allows you to inject a parser" do
    parser = double :render => "<p>hello world</p>"

    Metadown.render(text, parser).tap do |data|
      data.should be_kind_of(Metadown::Data)
      data.metadata.should eql({"key" => "value"})
      data.output.should eql("<p>hello world</p>")
    end
  end
end
