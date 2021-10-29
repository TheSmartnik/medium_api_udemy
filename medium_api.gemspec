require_relative 'lib/medium_api/version'

Gem::Specification.new do |spec|
  spec.name          = "medium_api"
  spec.version       = MediumApi::VERSION
  spec.authors       = [" TheSmartnik"]
  spec.email         = ["misharinn@gmail.com"]

  spec.summary       = %q{Medium Api Wrapper}
  spec.description   = %q{Gem to interact with medium.com API}
  spec.homepage      = "https://github.com/TheSmartnik/medium_api"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.20.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
