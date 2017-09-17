# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cocktail_library/version"

Gem::Specification.new do |spec|
  spec.name          = "cocktail_library"
  spec.version       = CocktailLibrary::VERSION
  spec.authors       = ["Lita Stephenson"]
  spec.email         = ["Lita.Stephenson@gmail.com"]

  spec.summary       = %q{returns a cocktail recipe from the cocktail db based on a liquor selection}
  spec.description   = %q{Enter your liquor of choice and receive a list of cocktails that you can make. Select your cocktail and see ingredientes and instructions for making your drink. Cocktails are sourced from the Cocktail Database: http://www.thecocktaildb.com/api.php.}
  spec.homepage      = "https://github.com/fuzzylita/cocktail_library"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = "cocktail_library"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
