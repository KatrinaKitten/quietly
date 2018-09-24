Gem::Specification.new do |s|
  s.name        = 'quietly'
  s.version     = '1.0.3'
  s.date        = '2017-10-16'
  s.summary     = "Makes IO redirection simple and easy."
  s.description = "Quietly aims to make dealing with IO redirection easy. It originally started as a simple function to silence output to stdout within a certain block, cleaning up and abstracting away the process of dealing with the IO pointers. Eventually, it expanded into a simple but effective tool for dealing with any instance where you need to redirect, split, or silence output."
  s.authors     = ["tripl3dogdare"]
  s.files       = ["lib/quietly.rb"]
  s.homepage    = 'http://rubygems.org/gems/quietly'
  s.license     = 'MIT'
end