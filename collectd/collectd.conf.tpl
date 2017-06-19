Hostname "{{ COLLECTD_HOST }}"

FQDNLookup false
Interval {{ COLLECTD_INTERVAL }}
Timeout 2
ReadThreads 5

LoadPlugin cpu
LoadPlugin interface
LoadPlugin load
LoadPlugin memory
LoadPlugin network

LoadPlugin python
<Plugin python>
  Import "collectd_gnocchi"
  <Module collectd_gnocchi>
    Endpoint "http://gnocchi-api:8041/"
    User admin
  </Module>
</Plugin>
