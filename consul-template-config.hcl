consul {
  address = "172.17.0.1:8500"

  retry {
    enabled = true

    attempts = 5

    backoff = "250ms"
  }
}

wait {
  min = "5s"
  max = "10s"
}

exec {
  command = "npm start --prefix /app"

  splay = "5s"

  env {
    pristine = false

    whitelist = ["CONSUL_*"]

    blacklist = ["VAULT_*"]
  }

  reload_signal = ""

  kill_signal = "SIGINT"

  kill_timeout = "2s"
}

template {
  source = "/app/template.json.ctmpl"

  destination = "/app/template.json"

  backup = true
}
