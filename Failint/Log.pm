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
        print STDERR "DEBUG: " . $message . "\n";
    }
}

sub info {
    my ($file, $lineno, $message) = @_;
    if ($options->{info}) {
        print "I: $file:$lineno:" . $message . "\n";
    }
}

sub warning {
    my ($file, $lineno, $message) = @_;
    print "W: $file:$lineno:" . $message . "\n";
}

sub error {
    my ($file, $lineno, $message) = @_;
    print "E: $file:$lineno:" . $message . "\n";
}

1;
