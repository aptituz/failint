package Failint::Checks::Log;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( &debug &info &warning &error $fai_dir $class_dir
$package_config_dir $debconf_dir $disk_config_dir $files_dir $hooks_dir
$scripts_dir );

our $fai_dir = $ARGV[0];
our $class_dir = $fai_dir . "/class_dir";
our $package_config_dir = $fai_dir . "/package_config";
our $debconf_dir = $fai_dir . "/debconf";
our $disk_config_dir = $fai_dir . "/disk_config";
our $files_dir = $fai_dir . "/files";
our $hooks_dir = $fai_dir . "/hooks";
our $scripts_dir = $fai_dir . "/scripts";

sub debug {
    my $message = shift;
    print "D|$message\n"
}

sub info {
    my ($file, $lineno, $message) = @_;
    print "I|$file|$lineno|$message\n"
}

sub warning {
    my ($file, $lineno, $message) = @_;
    print "W|$file|$lineno|$message\n"
}

sub error {
    my ($file, $lineno, $message) = @_;
    print "E|$file|$lineno|$message\n"
}

1;
