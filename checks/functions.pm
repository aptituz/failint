package functions;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(debug info warning error);

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


   
