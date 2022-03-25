datacenter = "{{ nomad_datacenter }}"
data_dir = "{{ nomad_data_dir }}"
disable_update_check = true

advertise {
  http = "{{ nomad_adv_addr }}"
  rpc = "{{ nomad_adv_addr }}"
  serf = "{{ nomad_adv_addr }}"
}

{% if nomad_server_role |bool %}
server {
  enabled = true
  bootstrap_expect = {{ nomad_bootstrap_expect }}
  raft_protocol = 3
{%   if nomad_encrypt_enable |bool %}
  encrypt = "{{ nomad_encrypt_key }}"
{%   endif %}
}
{% endif %}

{% if nomad_client_role |bool %}
client {
  enabled = true
{%   if nomad_disk_gc_thold %}
  gc_disk_usage_threshold = {{ nomad_disk_gc_thold }}
{%   endif %}

  reserved {
{%   if nomad_reserve_cpu %}
    cpu = {{ nomad_reserve_cpu }}
{%   endif %}
{%   if nomad_reserve_mem %}
    memory = {{ nomad_reserve_mem }}
{%   endif %}

{%   if range_min or range_max %}
{%     set range_comma = ',' if range_min and range_max else '' %}
    reserved_ports = "{{ range_min }}{{ range_comma }}{{ range_max }}"
{%   endif %}
  }
}
{% endif %}
