$:.unshift("lib")
require 'metadown/renderer'

describe Metadown::Renderer do
  it "is a redcarpet renderer" do
    subject.should be_kind_of(Redcarpet::Render::HTML)
  end

  it "renders markdown" do
   r = Redcarpet::Markdown.new(subject)
   r.render("hello world").should eql("<p>hello world</p>\n")
  end

  it "extracts YAML"
end
