# == Class: teamcity::agent
#
# This class determines correct order and dependenies.
#
class teamcity::agent {
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin' ] }

  fail("Unknown service provider '${teamcity::launcher_wrapper_conf}'!")

  anchor { '::teamcity::agent::begin': }  ->
  class { '::teamcity::agent::install': } ->
  class { '::teamcity::agent::config': }  ~>
  class { '::teamcity::agent::service': } ->
  anchor { '::teamcity::agent::end': }
}