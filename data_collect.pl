#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use LWP::Simple;
use JSON;
use Digest::SHA;

my $url = "http://localhost:5001/data";
my $content = get $url;

my $json = JSON->new;
my $data = $json->decode($content);

for ( @{$data->{samples}} ) {
   my $id = $_->{id};
   my $filename = "./files/$id.txt";
   open(FH, '>', $filename) or die $!;
   print FH $_->{name};
   close(FH);
   open(FH2, $filename) or die $!;
   binmode(FH2);

   my $digest = Digest::SHA->new(256);
   $digest->addfile(*FH2);
   my $hash = $digest->hexdigest(); 
   if ($hash eq $id) {
     print $hash, " $id\n"; 
   } else {
     print "File: $filename SHA256 does not match\n";
   }
}
