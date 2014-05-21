#!/usr/bin/perl
# Generate a random RFC1918 address

use strict;
use warnings;
use NetAddr::IP;

my @prefix_list = (
  '10.0.0.0/8',
  '192.168.0.0/16',
  '172.16.0.0/12',
);

foreach my $prefix (@prefix_list) {
  my $ip = NetAddr::IP->new($prefix);
  print n2ip(rndip(ip2n($ip->first->addr),ip2n($ip->last->addr))), "\n";
}


sub ip2n{ unpack 'N', pack 'C4', split '\.', $_[ 0 ] };                         
sub n2ip{ join '.', unpack 'C4', pack 'N', $_[ 0 ] };                           
sub rndip{ $_[0] + int rand( $_[1] - $_[0] + 1 ) }; 

exit 0;
