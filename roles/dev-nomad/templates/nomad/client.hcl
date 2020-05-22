client {
  enabled = true
  gc_disk_usage_threshold = 88

  reserved {
    cpu = 100
    memory = 20
    # leave only 26001-27000 for nomad
    reserved_ports = "20000-26000,27000-32000"
  }
}
