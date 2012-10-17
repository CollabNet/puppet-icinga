# == Class: icinga::plugins::checktotalprocs
#
# This class provides a checktotalprocs plugin.
#
class icinga::plugins::checktotalprocs (
  $check_warning  = '',
  $check_critical = ''
) inherits icinga {
  if $icinga::client {
    @@nagios_service { "check_total_procs_${::fqdn}":
      check_command       => 'check_nrpe_command!check_total_procs',
      service_description => 'Total processes',
      target              => "${::icinga::targetdir}/services/${::fqdn}.cfg",
    }
  }
}

