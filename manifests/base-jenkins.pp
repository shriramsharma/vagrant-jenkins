include jenkins
group { "puppet":
  ensure => "present",
}

exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

package { "openjdk-7-jre":
  ensure => "present",
  require => Exec["apt-get update"],
}

package { "openjdk-7-jdk":
  ensure => "present",
  require => Exec["apt-get update"],
}

package { "vim":
  ensure => "present",
  require => Exec["apt-get update"],
}
