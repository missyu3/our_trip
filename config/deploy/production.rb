# frozen_string_literal: true

server '54.95.167.89', user: 'app', roles: %w[app db web]
set :ssh_options, keys: '/Users/matsumoto/.ssh/id_rsa'
