use 5.008008;
use ExtUtils::MakeMaker;

WriteMakefile(
     NAME => 'list_versions',
     VERSION_FROM => 'list_versions.pl',
     PREREQ_PM => {
     	'Test::More'   => 0,
     	'Test::Script' => 1.02,
     },
     EXE_FILES => [ 'list_versions.pl' ],
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'list_versions.pl',
       AUTHOR         => 'Zoffix Znet <zoffix@cpan.org>') : ()),
);