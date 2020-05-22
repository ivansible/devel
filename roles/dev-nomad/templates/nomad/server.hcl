data_dir = "/var/lib/nomad"
disable_update_check = true

advertise {
  http = "185.117.72.220"
  rpc = "185.117.72.220"
  serf = "185.117.72.220"
}

server {
  enabled = true
  bootstrap_expect = 3
  raft_protocol = 3
  encrypt = "B5MJ31dNrLrtnt/t1QSCwg=="
}
