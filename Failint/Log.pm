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
    $options->{$key} = $value;
}

sub print_message {
    my $message = shift;
    $message =~ s/\s:\s/ /g;
    print $message . "\n";
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
        print_message($message);
    }
}

sub warning {
    my ($file, $lineno, $message) = @_;
    print_message("W: $file:$lineno " . $message);
}

sub error {
    my ($file, $lineno, $message) = @_;
    print_message("E: $file:$lineno " . $message);
}

1;
