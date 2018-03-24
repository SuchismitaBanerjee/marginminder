    #!/usr/bin/perl
     
    use strict;
    use LWP::UserAgent;
    use HTTP::Request::Common;
     
    my $apikey = 'iwXqJZ7rSsM-PfvtkQMLGN0aRVHnVR4DmvKyKOdU12';
    my $ua = LWP::UserAgent->new();
     
    my $res = $ua->request
    (
     POST 'https://api.textlocal.in/get_inboxes/?',
     Content_Type  => 'application/x-www-form-urlencoded',
     Content       => [
     					'apikey'    => $apikey
                      ]
    );
     
    if ($res->is_error) { die "HTTP Error\n"; }
    print "Response:\n\n" . $res->content . "\n\n";
