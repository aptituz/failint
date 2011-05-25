package Failint::Checks::Shell;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($LEADIN $FCOPY_CMD $CP_CMD $ROOTCMD);

our $LEADIN = qr'(?:(?:^|[`&;(\[|{])\s*|(?:if|then|do|while)\s+)';
our $CMDARGS = qr'\s*(?:([^;\]}\|`)#]+)|$)\s*(?:#.*)*';

our $FCOPY_CMD = $LEADIN . qr'(?:fcopy)' . $CMDARGS;
our $CP_CMD = $LEADIN . qr'(?:cp)' . $CMDARGS;

our $ROOTCMD = $LEADIN . qr'(?:\$ROOTCMD)';

1;
