# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :rails_env, "production"

#set server, user and role
server '10.251.91.74', user: 'deploy', roles: %s{app}
server '10.251.90.95', user: 'deploy', roles: %s{app}

#set folder destination
set :deploy_to, '/var/www/html/new_launch_api_releases'

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w{deploy@10.251.90.95 deploy@10.251.91.74}

#
# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.

#set github repository source
set :repo_url, 'git@github.com:urbanindo/rumah123-newlaunch-api.git'
#set application env, this will configured on setup.rake
set :application, 'r123-production-new'


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
set :ssh_options, {
    forward_agent: true,
    auth_methods: %w(publickey),
    user: 'deploy',
}
