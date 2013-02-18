# == Class: icinga::config::server::redhat
#
# This class provides server configuration for RHEL and derivative distro's.
#
class icinga::config::server::redhat {
<<<<<<< HEAD
=======
  if $::icinga::server {
    File {
      owner   => $::icinga::server_user,
      group   => $::icinga::server_group,
      require => Class['icinga::config'],
      notify  => [
        Service[$::icinga::service_client],
        Service[$::icinga::service_server],
        Group[$::icinga::server_cmd_group],
        Exec['fix_collected_permissions']
      ],
    }

    exec { 'fix_collected_permissions':
      # temporary work-around
      command     => "/bin/chown -R ${::icinga::server_user}:${::icinga::server_group} .",
      cwd         => $icinga::params::targetdir,
      notify      => Service[$::icinga::service_server],
      require     => File[$::icinga::targetdir],
      refreshonly => true,
    }

    file {
      $::icinga::icinga_vhost:
        ensure  => present,
        content => template('icinga/redhat/httpd.conf.erb'),
        notify  => Service[$::icinga::service_webserver];

      $::icinga::htpasswd_file:
        ensure => present,
        mode   => '0644';

      $::icinga::confdir_server:
        ensure  => directory,
        recurse => true,
        purge   => true;

      $::icinga::vardir_server:
        ensure => directory;

      $::icinga::logdir_server:
        ensure => directory;

      $::icinga::targetdir:
        ensure  => directory,
        recurse => true,
        purge   => true;

      "${::icinga::targetdir}/hosts":
        ensure  => directory,
        recurse => true;

      "${::icinga::targetdir}/contacts":
        ensure  => directory,
        recurse => true;

      "${::icinga::targetdir}/services":
        ensure  => directory,
        recurse => true;

      "${::icinga::targetdir}/commands":
        ensure  => directory,
        recurse => true;

      "${::icinga::confdir_server}/modules":
        ensure  => directory,
        recurse => true;

      "${::icinga::targetdir}/commands.cfg":
        ensure  => present,
        content => template('icinga/redhat/commands.cfg.erb');

      "${::icinga::targetdir}/notifications.cfg":
        ensure  => present,
        content => template('icinga/redhat/notifications.cfg.erb');

      "${::icinga::targetdir}/timeperiods.cfg":
        ensure  => present,
        content => template('icinga/redhat/timeperiods.cfg.erb');

      "${::icinga::targetdir}/templates.cfg":
        ensure  => present,
        content => template('icinga/redhat/templates.cfg.erb');

      "${::icinga::confdir_server}/cgi.cfg":
        ensure  => present,
        content => template('icinga/redhat/cgi.cfg.erb');

      "${::icinga::targetdir}/hostgroups.cfg":
        ensure  => present,
        content => template('icinga/redhat/hostgroups.cfg.erb');

      "${::icinga::targetdir}/generic-host.cfg":
        ensure  => present,
        content => template('icinga/redhat/generic-host.cfg');

      "${::icinga::targetdir}/generic-service.cfg":
        ensure  => present,
        content => template('icinga/redhat/generic-service.cfg');

      "${::icinga::targetdir}/generic-contact.cfg":
        ensure  => present,
        content => template('icinga/redhat/generic-contact.cfg.erb');

      "${::icinga::confdir_server}/icinga.cfg":
        ensure  => present,
        content => template('icinga/redhat/icinga.cfg.erb');

      "${::icinga::logdir_server}/archives":
        ensure => directory;

      "${::icinga::vardir_server}/rw":
        ensure  => directory,
        group   => $::icinga::server_cmd_group;

      "${::icinga::vardir_server}/checkresults":
        ensure => directory;

      "${::icinga::confdir_server}/resource.cfg":
        ensure  => present,
        content => template('icinga/redhat/resource.cfg.erb');
>>>>>>> 6a13aace5dc9a3fda89ff341594d0aafbf3a9ad3

  File {
    ensure  => present,
    owner   => $::icinga::server_user,
    group   => $::icinga::server_group,
    require => Class['icinga::config'],
    notify  => [
      Service[$::icinga::service_client],
      Service[$::icinga::service_server],
      Group[$::icinga::server_cmd_group],
      Exec['fix_collected_permissions']
    ],
  }

  exec { 'fix_collected_permissions':
    # temporary work-around
    command     => "/bin/chown -R ${::icinga::server_user}:${::icinga::server_group} .",
    cwd         => $icinga::params::targetdir,
    notify      => Service[$::icinga::service_server],
    require     => File[$::icinga::targetdir],
    refreshonly => true,
  }

  file{$::icinga::icinga_vhost:
    content => template('icinga/redhat/httpd.conf.erb'),
    notify  => Service[$::icinga::service_webserver],
  }

  file{$::icinga::vardir_server:
    ensure => directory,
  }

  file{$::icinga::logdir_server:
    ensure => directory,
  }

  file{"${::icinga::confdir_server}/modules":
    ensure  => directory,
    recurse => true,
  }

  file{"${::icinga::targetdir}/commands.cfg":
    content => template('icinga/redhat/commands.cfg.erb'),
  }

  file{"${::icinga::targetdir}/notifications.cfg":
    content => template('icinga/redhat/notifications.cfg.erb'),
  }

  file{"${::icinga::targetdir}/templates.cfg":
    content => template('icinga/redhat/templates.cfg.erb'),
  }

  file{"${::icinga::confdir_server}/cgi.cfg":
    content => template('icinga/redhat/cgi.cfg.erb'),
  }

  file{"${::icinga::targetdir}/generic-host.cfg":
    content => template('icinga/redhat/generic-host.cfg'),
  }

  file{"${::icinga::targetdir}/generic-service.cfg":
    content => template('icinga/redhat/generic-service.cfg'),
  }

  file{"${::icinga::confdir_server}/icinga.cfg":
    content => template('icinga/redhat/icinga.cfg.erb'),
  }

  file{"${::icinga::logdir_server}/archives":
    ensure => directory,
  }

  file{"${::icinga::vardir_server}/rw":
    ensure  => directory,
    group   => $::icinga::server_cmd_group,
  }

  file{"${::icinga::vardir_server}/checkresults":
    ensure => directory,
  }

  file{"${::icinga::confdir_server}/resource.cfg":
    content => template('icinga/redhat/resource.cfg.erb'),
  }

}
