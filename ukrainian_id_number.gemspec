# frozen_string_literal: true

require_relative "lib/ukrainian_id_number/version"

Gem::Specification.new do |spec|
  spec.name = "ukrainian_id_number"
  spec.version = UkrainianIdNumber::VERSION
  spec.authors = ["Yaroslav Nychka"]
  spec.email = ["Yaroslav Nychka"]

  spec.summary = "Get useful information from ukrainian id number"
  spec.description = "Ukrainian ID number or taxpayer 10-digit number"
  spec.homepage = "https://github.com/ukrainian_id_number"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ukrainian_id_number"
  spec.metadata["changelog_uri"] = "https://github.com/ukrainian_id_number/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
