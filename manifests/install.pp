# Installs the Docker Enterprise Edition package
class docker_ee::install {
  # Put EE repository URL in  /etc/yum/vars/dockerurl
  package { 'docker-ee':
    ensure => installed,
  }
}
