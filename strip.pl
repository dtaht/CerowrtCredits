#!/usr/bin/perl

sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

while (<>) {
	print trim($_),"\n";
}
