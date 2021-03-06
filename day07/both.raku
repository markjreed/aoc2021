#!/usr/bin/env raku
my ($positions, $min, $max) = lines[0].split(',')».Int.&{ $_, .min, .max };

sub fuel-between($x1, $x2, $puzzle=0) {
  my $dist = abs($x1 - $x2);
  $puzzle ?? $dist * ($dist + 1) / 2 !! $dist;
}

for ^2 -> $puzzle {
  say ($min .. $max).map(-> $x { [+] $positions.map: { fuel-between($x, $_, $puzzle) } }).min;
}
