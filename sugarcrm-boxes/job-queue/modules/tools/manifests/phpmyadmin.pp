class tools::phpmyadmin {

  package { 'phpmyadmin':
    ensure  => present,
    require => Package['php5', 'php5-mysql', 'apache2'],
  }

  file { '/etc/apache2/conf-enabled/phpmyadmin.conf':
    ensure  => link,
    target  => '/etc/phpmyadmin/apache.conf',
    require => Package['apache2', 'phpmyadmin'],
    notify  => Service['apache2']
  }
}
