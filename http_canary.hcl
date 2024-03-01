job "httpcanary" {
    datacenters = ["dc1"]

    group "echo" {
        count = 5
        update {
            canary = 1
            max_parallel = 5
        }

        network {
            port "http" {}
        }

        task "server" {
            driver = "docker"

            config {
                image = "hashicorp/http-echo:latest"

                ports = ["http"]

                args = [
                    "-listen", ":${NOMAD_PORT_http}",
                    "-text", "Update successfull!\nHello and welcome to ${NOMAD_IP_http} running on port ${NOMAD_PORT_http}",
                ]
            }

            service {
                name = "httpcanary"
                port = "http"

                tags = [
                    "urlprefix-/canary",
                ]

                check {
                    type = "http"
                    path = "/health"
                    interval = "10s"
                    timeout = "2s"
                }
            }
        }
    }
}