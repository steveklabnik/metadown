require File.expand_path("../lib/metadown/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Steve Klabnik"]
  gem.email         = ["steve@steveklabnik.com"]
  gem.description   = "This gem gives you a custom markdown parser" \
                      " that allows you to prefix the markdown itself with YAML metadata."
  gem.summary       = "Annotate your Markdown files with metadata."
  gem.homepage      = "http://rubydoc.info/gems/metadown/file/README.md"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "metadown"
  gem.require_paths = ["lib"]
  gem.version       = Metadown::VERSION

  gem.add_dependency "redcarpet"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "yard"
end
