require "spec_helper"

RSpec.describe Metadown::Renderer do
  subject(:renderer) { described_class.new }

  it "is a redcarpet renderer" do
    expect(renderer).to be_kind_of(Redcarpet::Render::HTML)
  end

  it "renders markdown" do
    r = Redcarpet::Markdown.new(renderer)
    expect(r.render("hello world")).to eql("<p>hello world</p>\n")
  end

  it "extracts YAML" do
    r = Redcarpet::Markdown.new(renderer)
    text = <<-MARKDOWN.strip_heredoc
      ---
      key: "value"
      ---
      hello world
    MARKDOWN

    r.render text

    expect(renderer.metadata).to eql({ "key" => "value" })
  end

  it "gives {} for no metadata" do
    Redcarpet::Markdown.new(renderer).render("hello world")

    expect(renderer.metadata).to eql({})
  end
end
