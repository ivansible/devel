datacenter = "{{ consul_datacenter }}"
data_dir = "{{ consul_data_dir }}"

{% if consul_encrypt_enable |bool %}
encrypt = "{{ consul_encrypt_key }}"
encrypt_verify_incoming = true
encrypt_verify_outgoing = true
{% endif %}

performance {
  raft_multiplier = {{ consul_raft_multiplier }}
}

bind_addr = "{{ consul_bind_addr }}"
advertise_addr = "{{ consul_adv_addr_lan }}"
advertise_addr_wan = "{{ consul_adv_addr_wan }}"
client_addr = "{{ consul_client_addr }}"
addresses = {
  dns = "{{ consul_addr_dns }}"
  http = "{{ consul_addr_http }}"
  https = "{{ consul_addr_https }}"
  grpc = "{{ consul_addr_grpc }}"
}
ports = {
  dns = {{ consul_port_dns }}
  http = {{ consul_port_http }}
  https = {{ consul_port_https }}
  serf_lan = {{ consul_port_serf_lan }}
  serf_wan = {{ consul_port_serf_wan }}
  server = {{ consul_port_server }}
  grpc = {{ consul_port_grpc }}
}


{% if consul_leader_host %}
retry_join = ["{{ consul_leader_host }}"]
{% endif %}
server = {{ consul_server_role |bool |to_json }}
bootstrap_expect = {{ consul_bootstrap_expect }}

ui = true
enable_script_checks = true
disable_update_check = true
