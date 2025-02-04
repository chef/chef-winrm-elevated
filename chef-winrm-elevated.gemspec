require 'date'

version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'chef-winrm-elevated'
  s.version = version
  s.date = Date.today.to_s

  s.author = ['Shawn Neal']
  s.email = ['sneal@sneal.net']
  s.homepage = 'https://github.com/chef/chef-winrm-elevated'

  s.summary = 'Ruby library for running commands as elevated'
  s.description = 'Ruby library for running commands via WinRM as elevated through a scheduled task'
  s.license = 'Apache-2.0'

  s.files = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md]
  s.require_path = 'lib'
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.required_ruby_version = '>= 3.0.0'
  # s.add_runtime_dependency 'chef-winrm', '>= 2.3.10'
  # s.add_runtime_dependency 'chef-winrm-fs', '~> 1.3'
  s.add_runtime_dependency 'erubi', '~> 1.8'
  s.add_development_dependency 'rake', '>= 13.2.1'
  s.add_development_dependency 'rexml'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rubocop', '~> 1.26.0'
end
