# frozen_string_literal: true

server 'ourtrip.work', user: 'app', roles: %w[app db web]

set :ssh_options, {
  port: 22,
  forward_agent: true,
  keys: ['/Users/matsumoto/.ssh/ourtrip_ssh.pem']
}