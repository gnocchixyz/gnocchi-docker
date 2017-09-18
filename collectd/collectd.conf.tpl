Hostname "{{ COLLECTD_HOST }}"

FQDNLookup false
Interval {{ COLLECTD_INTERVAL }}
Timeout 2
ReadThreads 5

LoadPlugin aggregation
<Plugin aggregation>
  <Aggregation>
    Plugin "cpu"
    Type "percent"
    GroupBy "Host"
    GroupBy "TypeInstance"
    CalculateNum false
    CalculateSum false
    CalculateAverage true
    CalculateMinimum false
    CalculateMaximum false
    CalculateStddev false
  </Aggregation>
</Plugin>

LoadPlugin cpu
<Plugin cpu>
  ReportByCpu true
  ReportByState true
  ValuesPercentage true
</Plugin>

LoadPlugin df
<Plugin df>
	ReportInodes true
	ValuesPercentage true
</Plugin>

LoadPlugin disk

LoadPlugin memory
<Plugin memory>
	ValuesAbsolute true
	ValuesPercentage true
</Plugin>

LoadPlugin processes
LoadPlugin uptime

LoadPlugin interface
LoadPlugin load
LoadPlugin network

LoadPlugin python
<Plugin python>
  Import "collectd_gnocchi"
  <Module collectd_gnocchi>
    Endpoint "http://gnocchi-api:8041/"
    User admin
  </Module>
</Plugin>
