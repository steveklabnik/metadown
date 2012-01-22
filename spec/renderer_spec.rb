$:.unshift("lib")
require 'metadown/renderer'

describe Metadown::Renderer do
  it "is a redcarpet renderer" do
    subject.should be_kind_of(Redcarpet::Render::HTML)
  end

  it "extracts YAML"
  it "renders markdown" 
end
