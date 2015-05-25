# Dev
# /etc/puppet/modules/sshd_gps/manifests/init.pp
# Class: sshd_gps
#
# This module manages sshd
#
# Parameters:
#
# Actions:
#
# Requires:
#
# [Remember: No empty lines between comments and class definition]
# Referncing http://www.example42.com/tutorials/PuppetTutorial/#slide-56
# Empty lines will produce no output
class sshd_gps 
{
    #
    # openssh
    package
    {
        'openssh' :
          ensure => installed,
    }
    file
    {
        '/etc/ssh/sshd_config' :
          owner => "root",
          mode => 444,
          # source => 'puppet:///files/sshd_config', # Found in generic folder
          # source => 'puppet:///files/sshd_gps/sshd_config',
          source => 'puppet:///modules/sshd_gps/sshd_config',
          # source => 'puppet:///modules/sshd_gps/files/sshd_config', # Not found
          # source => "puppet:///modules/ssh/sshd_config",
          notify => Service['sshd'],
          require => Package['openssh'],
    }
    service
    {
        'sshd' :
          ensure => running,
          enable => true,
          hasstatus => true,
          hasrestart => true,
    }
}
