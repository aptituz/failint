package Failint::Checks::Shell;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($LEADIN $FCOPY_CMD $CP_CMD);

our $LEADIN = qr'(?:(?:^|[`&;(\[|{])\s*|(?:if|then|do|while)\s+)';
our $CMDARGS = qr'([^;\]}\|`)]+)';
our $FCOPY_CMD = $LEADIN . qr'(?:fcopy) ' . $CMDARGS;
our $CP_CMD = $LEADIN . qr'(?:cp)' . $CMDARGS;


1;
