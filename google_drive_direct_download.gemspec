# frozen_string_literal: true

require_relative "lib/google_drive_direct_download/version"

Gem::Specification.new do |spec|
  spec.name          = "google_drive_direct_download"
  spec.version       = GoogleDriveDirectDownload::VERSION
  spec.authors       = ["Italo Matos"]
  spec.email         = ["italomatos@gmail.com"]

  spec.summary       = "Gem to generate direct download from Google Drive document"
  spec.description   = "This gem has a goal to generate direct download"
  spec.homepage      = "https://google.com.br"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://google.com.br"
  spec.metadata["changelog_uri"] = "https://google.com.br"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
