# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

# OPTIMIZE: the new version of rake does not put its DSL commands (task, file, desc, import, etc) in the root of the Object namespace anymore.The DSL commands are available by mixing in the Rake::DSL module into any module needing the commands. Until rails is updated to work with Rake 0.9.x
module ::Rails
  class Application
    include Rake::DSL
  end
end

module ::RakeFileUtils
  extend Rake::FileUtilsExt
end

ApSys::Application.load_tasks
