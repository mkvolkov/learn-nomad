job "httpecho" {
    datacenters = ["dc1"]

    group "echo" {
        count = 1
        network {
            port "http" {
              static = 8080
            }
        }

        task "server" {
            driver = "docker"

            config {
                image = "hashicorp/http-echo:latest"

                ports = ["http"]

                args = [
                    "-listen", ":8080",
                    "-text", "Hello and welcome to 127.0.0.1 running on port 8080",
                ]
            }
        }
    }
}
