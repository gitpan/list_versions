use ExtUtils::MakeMaker;

WriteMakefile(
     NAME => 'list_versions',
     VERSION_FROM => 'list_versions.pl',
     PREREQ_PM => {},
     AUTHOR => 'Zoffix Znet <cpan@zoffix.com>',
     EXE_FILES => [ 'list_versions.pl' ],
);