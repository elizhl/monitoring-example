data_dir = "consul_config/consul/"
log_level = "DEBUG"

datacenter = "dc1"

ui = true
server = true
bootstrap_expect = 1

bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"

ports {
  http = 8500
}

advertise_addr = "127.0.0.1"

acl = {
  enabled = false
  default_policy = "deny"
  down_policy = "extend-cache"
}

telemetry = {
  prometheus_retention_time = "24h"
  disable_hostname = true
}