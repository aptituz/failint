package Failint::Checks::Log;

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw( &debug &info &warning &error &verbose );

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

sub verbose {
    my ($message) = @_;
    print $message . "\n";
}

1;
