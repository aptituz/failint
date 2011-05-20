#!/usr/bin/perl

use strict;
use warnings;

package Failint::Log;
require Exporter;

use Data::Dumper;

our @ISA = qw(Exporter);
our @EXPORT = qw(Configure error warning info debug);

our $options = {
    debug => 0
};

sub Configure {
    my ($key, $value) = @_;
    print "Setting $key to $value\n";
    $options->{$key} = $value;
}

sub debug {
    my $message = shift;
    if ($options->{debug}) {
        print STDERR "DEBUG: " . $message;
    }
}

sub info {
    my $message = shift;
    if ($options->{info}) {
        print "I: " . $message;
    }
}

sub warning {
    my $message = shift;
    print "W: " . $message;
}

sub error {
    my $message = shift;
    print "E: " . $message;
}

1;
