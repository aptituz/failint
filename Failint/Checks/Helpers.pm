package Failint::Checks::Helpers;

use Failint::Checks::Log;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw( gte_fh get_interpreter check_script_for_syntax_errors
check_script_is_executable);

sub open_file {
    my $f = shift;
    my $fh;
    open($fh, "<", $f) or die "unable to open $f: $!";
    return $fh;
}     

sub get_interpreter {
    my $fh = open_file(shift);
    my $first_line = <$fh>;
    if (not $first_line =~ /^#!(.*)/) {
        return undef;
    } else {
        my $interpreter = $1;
        $interpreter =~ s/^\s+|\s+$//g;
        return $interpreter;
    }
}

sub check_script_is_executable {
    my ($name, $fname) = @_;
    if (not -x $fname) {
        warning($fname, "", "$name is not executable");
    }
}

sub check_script_for_syntax_errors {
    my $fname = shift;
    my $interpreter = get_interpreter($fname);

    # Test syntax of script for known interpreters
    # but skip some interpreters because -n is buggy..
    return if $interpreter =~ /^(z|t?c)sh$/;

    if ($interpreter =~ /sh/) {
        if (-x $interpreter) {
           system($interpreter, "-n", $fname);
           my $rc = $? >> 8;
           warning($fname,"", "shell script has syntax errors")
            unless $rc == 0;
        }
    } elsif ($interpreter =~ /perl/) {
        if (-x $interpreter) {
            system($interpreter, "-c", $fname, ">/dev/null");
            my $rc = $? >> 8;
            warning($fname, "", "perl script has compilation errors")
                unless $rc == 0;
        }
    }
}

1;
