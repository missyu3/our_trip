# frozen_string_literal: true

server 'ourtrip.work', user: 'app', roles: %w[app db web]
set :ssh_options, keys: '/Users/matsumoto/.ssh/id_rsa'

set :ssh_options, {
  port: 22,
  forward_agent: true,
  keys: ['~/.ssh/id_rsa']
}