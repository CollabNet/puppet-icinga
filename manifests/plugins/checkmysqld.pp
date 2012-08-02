class icinga::plugins::checkmysqld (
  $ensure             = present,
  $perfdata           = false,
  $max_check_attempts = '4'
) inherits icinga {

  $pkg_nagios_plugins_mysqld = $::operatingsystem ? {
    /CentOS|RedHat/ => 'nagios-plugins-mysqld',
    /Debian|Ubuntu/ => 'nagios-plugin-check-mysqld',
  }

  $pkg_perl_mysql_connecter = $::operatingsystem ? {
    /CentOS|RedHat/ => 'perl-DBD-MySQL',
    /Debian|Ubuntu/ => 'libdbd-mysql-perl',
  }

  package {
    $pkg_perl_mysql_connecter:
      ensure => $ensure;

    $pkg_nagios_plugins_mysqld:
      ensure => $ensure,
      notify => Service[$icinga::service_client];
  }

  @@nagios_service { "check_mysqld_performance_${::hostname}":
    check_command       => 'check_nrpe_command!check_mysqld',
    service_description => 'mysqld',
    target              => "${::icinga::targetdir}/services/${::fqdn}.cfg",
    action_url          => '/pnp4nagios/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',
  }

  if $perfdata {
    file {
      "${::icinga::includedir_client}/mysqld_performance.cfg":
        ensure  => $ensure,
        notify  => Service[$icinga::service_client],
        content => template('icinga/plugins/mysqld_performance.cfg.erb');
    }

    Nagios_service {
      host_name          => $::fqdn,
      max_check_attempts => $max_check_attempts,
      target             => "${::icinga::targetdir}/services/${::fqdn}.cfg",
    }

    @@nagios_service { "check_mysqld_performance_1_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_1',
      service_description => 'mysqld perf 1',
      action_url          => '/pnp4nagios/graph?host=$HOSTNAME$&srv=$SERVICEDESC$',
    }

    @@nagios_service { "check_mysqld_performance_2_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_2',
      service_description => 'mysqld perf 2',
    }

    @@nagios_service { "check_mysqld_performance_3_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_3',
      service_description => 'mysqld perf 3',
    }

    @@nagios_service { "check_mysqld_performance_4_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_4',
      service_description => 'mysqld perf 4',
    }

    @@nagios_service { "check_mysqld_performance_5_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_5',
      service_description => 'mysqld perf 5',
    }

    @@nagios_service { "check_mysqld_performance_6_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_6',
      service_description => 'mysqld perf 6',
    }

    @@nagios_service { "check_mysqld_performance_7_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_7',
      service_description => 'mysqld perf 7',
    }

    @@nagios_service { "check_mysqld_performance_8_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_8',
      service_description => 'mysqld perf 8',
    }

    @@nagios_service { "check_mysqld_performance_9_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_9',
      service_description => 'mysqld perf 9',
    }

    @@nagios_service { "check_mysqld_performance_10_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_10',
      service_description => 'mysqld perf 10',
    }

    @@nagios_service { "check_mysqld_performance_11_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_11',
      service_description => 'mysqld perf 11',
    }

    @@nagios_service { "check_mysqld_performance_12_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_12',
      service_description => 'mysqld perf 12',
    }

    @@nagios_service { "check_mysqld_performance_13_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_13',
      service_description => 'mysqld perf 13',
    }

    @@nagios_service { "check_mysqld_performance_14_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_14',
      service_description => 'mysqld perf 14',
    }

    @@nagios_service { "check_mysqld_performance_15_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_15',
      service_description => 'mysqld perf 15',
    }

    @@nagios_service { "check_mysqld_performance_16_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_16',
      service_description => 'mysqld perf 16',
    }

    @@nagios_service { "check_mysqld_performance_17_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_17',
      service_description => 'mysqld perf 17',
    }

    @@nagios_service { "check_mysqld_performance_18_${::hostname}":
      check_command       => 'check_nrpe_command!check_mysqld_performance_18',
      service_description => 'mysqld perf 18',
    }
  }
}

