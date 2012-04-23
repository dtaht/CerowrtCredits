#!/usr/bin/perl

sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

while (<>) {
	@addr = split(/ /);
	$a="";
	foreach(@addr) {
		if (!($_ =~ m/@/)) {
		$a = $a . " " . $_;
		}
	}
	print trim($a),"\n";
}
