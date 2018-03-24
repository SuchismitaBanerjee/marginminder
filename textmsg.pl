#!/usr/bin/perl
 
use strict;
use LWP::UserAgent;
use HTTP::Request::Common;
 
my $apikey = 'iwXqJZ7rSsM-PfvtkQMLGN0aRVHnVR4DmvKyKOdU12'; 
my $sender = "TXTLCL";
my $numbers = "9764947095";
my $message = "This is your message";
my $ua = LWP::UserAgent->new();
 
my $res = $ua->request
(
 POST 'https://api.textlocal.in/send/?',
 Content_Type  => 'application/x-www-form-urlencoded',
 content => [
		'apikey'	=> $apikey,
		'numbers'	=> $numbers,
		'message'	=> $message,
		'sender'	=> $sender
		]
);
 
if ($res->is_error) { 
print "Response:\n\n" . $res->content . "\n\n";
die "HTTP Error\n"; }
print "Response:\n\n" . $res->content . "\n\n";
