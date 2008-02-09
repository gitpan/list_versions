#!/usr/bin/perl -w

use strict;
use warnings;

our $VERSION = '0.04';

die "Usage: ver MODULE1 MODULE2 .. MODULEN\n"
    unless @ARGV;

my $max_length = 0;

foreach my $mod ( @ARGV ) {
    my $l = length $mod;
    $max_length = $l
        if $l > $max_length;
}

$max_length+=2;

print "\n";
foreach my $mod ( @ARGV ) {
    my $version;
    eval "use $mod; \$version = $mod->VERSION;";
    if ( $@ ) {
        print "\nERROR: $@\n";
    }

    $version ||= 0;

    printf qq|        %-${max_length}s => %s,\n|, qq|'$mod'|, $version;
}

print "\n\n";

print qq|    use_ok('$_');\n| for @ARGV;
print "\n";

=head1 NAME

list_versions - "easify" writing Makefile.PL and Build.PL by
easily listing versions of modules.

=head1 DESCRIPTION

This is a tiny script that takes module names as command
line arguments and prints the versions installed in a format suitable
for copy/pasting into Build.PL or Makefile.PL as well as
basic C<use_ok()> test for each of them to include in L<Test::More>
tests.

=head1 USAGE

    list_versions.pl Carp URI LWP::UserAgent Some::OtherModule LWP

=head1 OUTPUT

This is a sample of printed output for the USAGE sample:

            'Carp'              => 1.04,
            'URI'               => 1.35,
            'LWP::UserAgent'    => 2.036,

    ERROR: Can't locate Some/OtherModule.pm in @INC (@INC contains:
    /etc/perl /usr/local/lib/perl/5.8.8 /usr/local/share/perl/5.8.8
    /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.8 /usr/share/perl/5.8
    /usr/local/lib/site_perl .) at (eval 7) line 1.
    BEGIN failed--compilation aborted at (eval 7) line 1.

            'LWP'               => 5.808,


        use_ok('Carp');
        use_ok('URI');
        use_ok('LWP::UserAgent');
        use_ok('Some::OtherModule');
        use_ok('LWP');

I<Note:> if Module->VERSION returns C<undef> the version will be indicated
as C<0>.

=head1 AUTHOR

Zoffix Znet (zoffix@cpan.org)

( L<http://zoffix.com>, L<http://haslayout.net> )

=head1 LICENSE

There is no license. You may do whatever you want with this program and
author is in no way reliable for ANYTHING that will happen.

=cut
