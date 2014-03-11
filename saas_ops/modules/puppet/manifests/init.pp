class puppet {
  file {
    "/home/vagrant/.puppet/":
    ensure => directory,
    owner  => vagrant,
    group  => vagrant,
    mode   => 775,
    before => File["/home/vagrant/.puppet/puppet.conf"]
  }
  file {
    "/home/vagrant/.puppet/puppet.conf":
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/puppet/puppet.conf"
  }
}
