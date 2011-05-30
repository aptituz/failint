package Failint::Parser;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(parse_line);

use Failint::Log;

our $action_re = qr/^([EIW]?)\|(.*)\|(.*)\|(.*)$/;
our $debug_re = qr/^(D)\|(.*)\|(.*)$/;

sub parse_line {
    my $line = shift;

    debug("parse_line('$line')", 2);
    if ($line =~ $action_re) {
        debug("line matches action_re", 3);
        return ($1, $2, $3, $4);
    } elsif ($line =~ $debug_re) {
        debug("line matches debug_re", 3);
        return ($1, undef, undef, $2, $3);
    } else {
        debug("line matches no re", 3);
        return (undef, undef, undef, $line);
    }
}

1;
