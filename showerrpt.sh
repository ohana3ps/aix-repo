#!/usr/bin/perl
use strict;
use warnings;

my $minutes = "";
if ($#ARGV == 0) {$minutes = $ARGV[0];}

if ($minutes =~ /^\d+$/) {
        print "Showing errpt entries in last $minutes minutes\n";
}else{
        print "Specify number of minutes as argument\n";
        exit 2
}

my ($min,$hr,$day,$mth,$yr) = (localtime(time() - 60*$minutes))[1,2,3,4,5];
my $date = sprintf '%02d%02d%02d%02d%02d',$mth+1,$day,$hr,$min,$yr-100;
system("errpt -s $date");
