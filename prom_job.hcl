job "metrics-db" {

  datacenters = ["dc1"]
  region      = "sfo-region"
  type        = "service"

  group "prometheus" {
    task "prometheus" {
      driver = "docker"
      config {
        image = "prom/prometheus"
         port_map {
          service_port = 9090
        }

        volumes = [
          "~/workspace/t-mobile/monitoring-example/prometheus/prometheus.yaml:/etc/prometheus/prometheus.yml"
        ]
      }

      resources {
        cpu    = 50
        memory = 50

        network {
            mbits = 10
            port "service_port" {
              static = 9990
            }
        }
      }

      service {
        name = "prometheus"
        port = "service_port"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}