require "spec_helper"

RSpec.describe Metadown do
  let(:text) do
    <<-MARKDOWN.strip_heredoc
      ---
      key: "value"
      ---
      hello world
    MARKDOWN
  end

  it "provides a factory", :aggregate_failures do
    Metadown.render(text).tap do |data|
      expect(data).to be_kind_of(Metadown::Data)
      expect(data.metadata).to eql({ "key" => "value" })
      expect(data.output).to eql("<p>hello world</p>\n")
    end
  end

  it "allows you to inject a parser", :aggregate_failures do
    parser = double({ render: "<p>hello world</p>" })

    Metadown.render(text, parser).tap do |data|
      expect(data).to be_kind_of(Metadown::Data)
      expect(data.metadata).to eql({ "key" => "value" })
      expect(data.output).to eql("<p>hello world</p>")
    end
  end
end
