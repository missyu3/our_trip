# frozen_string_literal: true

server '3.113.117.184', user: 'app', roles: %w[app db web]

set :ssh_options, {
  port: 22,
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}