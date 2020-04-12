package Data::Dumper::AutoEncode::AsDumper;

our $VERSION = '1.01';

use strict; use warnings; use utf8;
use Import::Into;
use Data::Dumper::AutoEncode ();

$Data::Dumper::Indent        = 1;
$Data::Dumper::Quotekeys     = 0;
$Data::Dumper::Sortkeys      = 1;
$Data::Dumper::Terse         = 1;
$Data::Dumper::Trailingcomma = 1;

use parent 'Exporter';
our @EXPORT = 'Dumper';

sub Dumper { goto &Data::Dumper::AutoEncode::eDumper }

__PACKAGE__->import::into('main');

1; # return true

=pod

=head1 NAME

Data::Dumper::AutoEncode::AsDumper - Dump encoded data with Dumper()

=head1 SYNOPSIS

  use utf8;
  use Data::Dumper::AutoEncode::AsDumper;

  $data = {
      русский  => 'доверяй, но проверяй',
      i中文    => '也許你的生活很有趣',
      Ελληνικά => 'ἓν οἶδα ὅτι οὐδὲν οἶδα',
  };

  say 'proverbs', Dumper $data;

=head1 DESCRIPTION

This package implements a wrapper around the excellent module
L<Data::Dumper::AutoEncode>, which provides a function (C<eDumper>) to
output encoded data with L<Data::Dumper>. If you use this module
instead, you can still use C<Dumper $data> in your code, but the output
will be encoded.

=head2 CONCISION

The following C<Data::Dumper> options are set:

  $Data::Dumper::Indent        = 1;
  $Data::Dumper::Quotekeys     = 0;
  $Data::Dumper::Sortkeys      = 1;
  $Data::Dumper::Terse         = 1;
  $Data::Dumper::Trailingcomma = 1;

=head1 EXPORTED FUNCTION

B<Dumper(LIST)>

This module exports one function, C<Dumper>. It works just like the
original, except that output is encoded, by default to C<utf8>.

If you want to change the encoding, set the global:

  $Data::Dumper::AutoEncode::ENCODING = 'CP932';

=head2 EXPORTS TO SUBCLASSES BY DEFAULT

This module uses the excellent L<Import::Into> so that any subclass
of a class that uses it will import the C<Dumper> function.

You can turn this behaviour off by setting the global:

  $Data::Dumper::AutoEncode::AsDumper:ImportInto = 0;

=head1 SEE ALSO

L<Data::Dumper::AutoEncode>, L<Data::Dumper>

=cut
