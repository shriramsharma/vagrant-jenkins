class jenkins {

exec { "download_jenkins":
command => "wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -",
path => $path,
require => Package["openjdk-7-jdk"],
timeout => 0
}

exec { "jenkins_command_1" :
  command => "sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
  path => $path,
  require => Exec["download_jenkins"],
  timeout => 0
}

exec { "apt-get update jenkins":
  command => "/usr/bin/apt-get update",
  require => Exec["jenkins_command_1"],
}

package { "jenkins":
  ensure => "present",
  require => Exec["apt-get update jenkins"],
}


}
