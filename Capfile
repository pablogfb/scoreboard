# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/rails/assets' # for asset handling add
require 'capistrano/rails/migrations' # for running migrations
require 'capistrano/puma'
install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Systemd

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
