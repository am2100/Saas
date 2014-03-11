class emacs {

  File {
    ensure => present,
	owner  => vagrant,
	group  => vagrant,
	mode   => 755
  }
  
  file {
    "/home/vagrant/elisp":
	  ensure => directory;
  
    "/home/vagrant/.emacs":
	  source => "puppet:///modules/emacs/.emacs";
  
    "/home/vagrant/elisp/install.el":
	  source => "puppet:///modules/emacs/install.el";
	  
	"/home/vagrant/elisp/haml-mode.el":
	  source => "puppet:///modules/emacs/haml-mode.el";
	  
	"/home/vagrant/elisp/scss-mode.el":
	  source => "puppet:///modules/emacs/scss-mode.el";
	  
	"/home/vagrant/elisp/web-mode.el":
	  source => "puppet:///modules/emacs/web-mode.el";
	  
	"/home/vagrant/elisp/yaml-mode.el":
	  source => "puppet:///modules/emacs/yaml-mode.el";

  }
}
