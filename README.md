# Metadown

[![Build Status](https://secure.travis-ci.org/steveklabnik/metadown.png)](http://travis-ci.org/steveklabnik/metadown)

tl;dr... This gem gives you a custom markdown parser that allows you to prefix the
markdown itself with YAML metadata.

Sometimes, just having plain markdown isn't good enough. Say you're writing
a blog post, and you want to include some information about the post itself,
such as the date and time it was posted.  Keeping it in a separate file seems
like a bad idea, but Markdown doesn't have any good way of doing this.

Enter [Jekyll](https://github.com/mojombo/jekyll). It lets you put some YAML
at the head of your file:

    ---
    layout: post
    title: An Awesome Blog Post
    ---
    
    Four score and seven years ago,

Woudn't that be neat to use on other projects? I thought so too! Hence,
metadown.

Furthermore, you don't have to have just markdown. Inject any kind of
parser you'd like!

## Installation

Add this line to your application's Gemfile:

    gem 'metadown'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metadown

## Usage

Metadown might have the simplest API I've ever written: one method! Just send
the string with the metadown you want rendered, and boom! You get an object
back with two attributes: output and metadata.

    require 'metadown'
    
    data = Metadown.render("hello world")
    data.output #=> "<p>hello, world</p>"
    data.metadata #=> "{}"
    
    text = <<-MARKDOWN
    ---
    key: "value"
    ---
    hello world
    MARKDOWN
    
    data = Metadown.render(text)
    data.output #=> "<p>hello, world</p>\n"
    data.metadata #=> {"key" => "value"}

The default Markdown parser Metadown uses is pretty simple. If you'd
like to change it, you can inject your own in the standard Redcarpet 
fashion. Here's an example with code highlighting using Pygments.

```ruby
class HTMLwithPygments < Metadown::Renderer
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end
end
```

Then use it with Metadown like this:

```ruby
require 'metadown'
require 'html_with_pygments'

renderer = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)
data = Metadown.render("```ruby\nself\n```", renderer)
data.output   #=> "<div class=\"highlight\"><pre><span class=\"nb\">self</span>\n</pre>\n</div>\n"
data.metadata #=> "{}"
```

The Redcarpet [README](https://github.com/vmg/redcarpet/blob/master/README.markdown)
has more examples on how to customize your Markdown rendering.
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
