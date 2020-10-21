# frozen_string_literal: true

server '3.113.117.184', user: 'app', roles: %w[app db web]

set :ssh_options, {
  port: 22,
  forward_agent: true,
  keys: ['~/.ssh/id_rsa']
}