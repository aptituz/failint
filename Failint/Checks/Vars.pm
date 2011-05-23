package Failint::Checks::Vars;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( $fai_dir $class_dir $package_config_dir $debconf_dir
$disk_config_dir $files_dir $hooks_dir $scripts_dir );

our $fai_dir = $ARGV[0];
our $class_dir = $fai_dir . "/class";
our $package_config_dir = $fai_dir . "/package_config";
our $debconf_dir = $fai_dir . "/debconf";
our $disk_config_dir = $fai_dir . "/disk_config";
our $files_dir = $fai_dir . "/files";
our $hooks_dir = $fai_dir . "/hooks";
our $scripts_dir = $fai_dir . "/scripts";

1;
