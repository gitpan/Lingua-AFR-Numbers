#!/usr/bin/env perl
# For Emacs: -*- mode:cperl; mode:folding -*-
#
# Copyright (C) PetaMem, s.r.o. 2009-present
#

# {{{ use block

use strict;
use warnings;
use utf8;

use Test::More;

# }}}

# {{{ basic tests

my $tests;

BEGIN {
    use_ok('Lingua::AFR::Numbers');
    $tests++;
}

use Lingua::AFR::Numbers           qw(:ALL);

# }}}

# {{{ parse

my $numbers = Lingua::AFR::Numbers->new;

my $got = parse($numbers, 12345);
my $exp = 'twaalf duisend, drie honderd vyf en viertig';
is($got, $exp, '12345 in Afrikans');
$tests++;

$got = parse($numbers, 999);
$exp = 'nege honderd nege en negentig';
is($got, $exp, '999 in Afrikans');
$tests++;

$got = parse($numbers, 100000000000000);
$exp = q{};
is($got, $exp, 'out of bounds');
$tests++;

$got = parse($numbers, undef);
$exp = q{};
is($got, $exp, 'undef args');
$tests++;

# }}}

done_testing($tests);

__END__
