require "spec_helper"

describe Metadown::Renderer do
  it "is a redcarpet renderer" do
    subject.should be_kind_of(Redcarpet::Render::HTML)
  end

  it "renders markdown" do
    r = Redcarpet::Markdown.new(subject)
    r.render("hello world").should eql("<p>hello world</p>\n")
  end

  it "extracts YAML" do
    r = Redcarpet::Markdown.new(subject)
    text = <<-MARKDOWN.strip_heredoc
      ---
      key: "value"
      ---
      hello world
    MARKDOWN

    r.render text

    subject.metadata.should eql({ "key" => "value" })
  end

  it "gives {} for no metadata" do
    Redcarpet::Markdown.new(subject).render("hello world")

    subject.metadata.should eql({})
  end
end
