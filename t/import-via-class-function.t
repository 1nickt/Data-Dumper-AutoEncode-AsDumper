use strict;
use warnings;
use utf8;
use Test::More;
use Encode;
use Capture::Tiny 'capture_stderr';
use FindBin '$RealBin';

my $expected = encode_utf8 q!{
  'i中文' => '也許你的生活很有趣',
  'Ελληνικά' => 'ἓν οἶδα ὅτι οὐδὲν οἶδα',
  'русский' => 'доверяй, но проверяй',
}
!;

subtest 'function is imported via object method' => sub {
    my $dump = capture_stderr(sub {
        qx{perl $RealBin/import-via-class-function.pl}
    });

    is( $dump, $expected, 'output ok' );
};

done_testing;
__END__