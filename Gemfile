source "https://rubygems.org"
gemspec

# chef-winrm-fs 1.4.2 requires "logger" without declaring it, which breaks on
# Ruby 4.0 where logger is no longer a default gem. Pulling it in here keeps
# CI green on 4.0. Remove once a chef-winrm-fs release carrying the fix
# (chef/chef-winrm-fs#22) is available.
gem "logger"
