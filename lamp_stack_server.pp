package { 'apache2':
	ensure => installed,
}
package { 'php':
	ensure => installed,
	notify => Service['apache2'],
	require => [Package['apache2']],
}
file { '/var/www/html/phpinfo.php':
	source => '/home/keegan/kv_inet4031_puppet/phpinfo.php',
	notify => Service['apache2'],
	require => [Package['apache2']],
}
service { 'apache2':
	ensure => running,
	enable => true,
	require => [Package['apache2'], Package['php']],
}
package { 'libapache2-mod-php':
	ensure => installed,
	notify => Service['apache2'],
	require => [Package['apache2'], Package['php']],
}
package { 'php-cli':
	ensure => installed,
	notify => Service['apache2'],
	require => [Package['apache2'], Package['php']],
}
package { 'php-mysql':
	ensure => installed,
	notify => Service['apache2'],
	require => [Package['apache2'], Package['php']],
}
package { 'mariadb-server':
	ensure => installed,
	notify => Service['apache2'],
}
service { 'mariadb':
	ensure => running,
	enable => true,
	require => [Package['mariadb-server']],
}
