set :application, "lumlate"
set :domain, "lumlate.com"
set :repository,  "git@github.com:lumlateops/Lumlate.git"
set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain
role :app, domain
role :db,  domain, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start, :roles => :app do 
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :stop, :roles => :app do
    #Do Nothing
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
