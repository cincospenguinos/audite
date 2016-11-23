$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = 'audite'
  s.version       = '0.4.1'
  s.authors        = ['Matthias Georgi', 'Andre LaFleur']
  s.email         = %w(matti.georgi@gmail.com andre.lafleur@utah.edu)
  s.homepage      = 'http://georgi.github.com/audite'
  s.summary       = 'Portable mp3 player'
  s.description   = 'Portable mp3 player built on mpg123 and portaudio'

  s.bindir        = 'bin'
  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.extra_rdoc_files = ['README.md']

  s.extensions << 'ext/mpg123/extconf.rb'
  s.extensions << 'ext/portaudio/extconf.rb'
end
