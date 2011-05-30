#!/usr/bin/perl

use strict;
use warnings;

package Failint::Log;
require Exporter;

use Data::Dumper;

our @ISA = qw(Exporter);
our @EXPORT = qw(Configure error warning info debug);

our $options = {
    debug_lvl => 0,
    info => 0
};

sub Configure {
    my (%keys) = @_;
    while(my ($key, $value) = each %keys) {
        die "invalid configuration key ($key) specified"
            unless (defined $options->{$key});
        $options->{$key} = $value;
    }
}

sub print_message {
    my $message = shift;
    $message =~ s/\s:\s/ /g;
    print $message . "\n";
}

sub debug {
    my ($message, $message_lvl) = @_;
    $message_lvl = 1 unless defined($message_lvl);

    if ($message_lvl <= $options->{debug_lvl}) {
        print STDERR "DEBUG: " . $message . "\n";
    }
}

sub info {
    my ($file, $lineno, $message) = @_;
    if ($options->{info}) {
        print_message("I: $file:$lineno " . $message);
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
