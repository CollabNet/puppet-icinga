# == Class: icinga::plugins::icingaweb
#
# This class provides the Icinga-web plugin.
#
class icinga::plugins::icingaweb {
  if $icinga::server {
    include icinga::plugins::icingaweb::install
    include icinga::plugins::icingaweb::config

    Class['icinga::plugins::icingaweb::install'] ->
    Class['icinga::plugins::icingaweb::config']
  }
}
