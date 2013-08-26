# == Class: icinga::plugins::checktotalprocs
#
# This class provides a checktotalprocs plugin.
#
class icinga::plugins::checktotalprocs (
  $check_warning         = '',
  $check_critical        = '',
  $notification_period   = $::icinga::notification_period,
  $notifications_enabled = $::icinga::notifications_enabled,
  $warning_level         = $::icinga::params::checktotalprocs_warning_level,
  $critical_level        = $::icinga::params::checktotalprocs_critical_level,
) inherits icinga {

  if $icinga::client {
    @@nagios_service { "check_total_procs_${::fqdn}":
      check_command         => "check_nrpe_command_args!check_total_procs!${icinga::plugins::checktotalprocs::warning_level} ${icinga::plugins::checktotalprocs::critical_level}",
      service_description   => 'Total processes',
      notification_period   => $notification_period,
      notifications_enabled => $notifications_enabled,
      target                => "${::icinga::targetdir}/services/${::fqdn}.cfg",
    }
  }

}
