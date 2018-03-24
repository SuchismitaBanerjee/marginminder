#!/usr/bin/perl 



package communicator;
sub new {
   my $class = shift;
   my $self = { };
   bless $self, $class;
   return $self;
}

sub createInbox(){
   my ( $self, $con ) = @_;
	my $iID = substr($con,index($con,":")+1,index($con,",")-index($con,":")-1);
	my $subcon = substr($con,index($con,",")+1);
	my $noofmsg = substr($subcon,index($subcon,":")+1,index($subcon,",")-index($subcon,":")-1);
	my @gort = ();
	my $inbox3 = new Inbox( $iID, $noofmsg , @gort );
	my @swdw = $inbox3->getList();
	my $wer="";
	my $r = 0;

	for ($r = 0; $r < $noofmsg; $r = $r + 1){

	my $subcon2="";

	if($r != 0){
	$subcon2 = substr($wer,index($wer,"},{")+3);
	}
	else{
	$subcon2 = substr($subcon,index($subcon,"\"messages\""));
	}


	my $rid = substr($subcon2,index($subcon2,"\":\"")+3,index($subcon2,"\",\"")-index($subcon2,"\":\"")-3);
	my $subcon3 = substr($subcon2,index($subcon2,"\",\"")+3);
	my $num = substr($subcon3,index($subcon3,":")+1,index($subcon3,",")-index($subcon3,":")-1);
	my $subcon4 = substr($subcon3,index($subcon3,",")+1);
	my $msg= substr($subcon4,index($subcon4,"\":\"")+3,index($subcon4,"\",\"")-index($subcon4,"\":\"")-3);
	my $gep=new Reply($rid, $num, $msg);
	
	#$com->addReply($gep);
	#$com->addReplyInCloud($gep);
	push @swdw,$gep;
	$inbox3->setMessageList($gep);
	my $ewdw = $inbox3->getList();
	print "EWDW: ".$ewdw." \n\n";
	print "SWDW: @swdw \n\n";
	$wer = $subcon4;

	}

	return $inbox3;

	}



sub addReply {
   my ( $self, $rep ) = @_;
	my $fb = Firebase->new(firebase => 'marginminder-e6fc0', auth => { secret => 'w0SBCjYMFdHb4wE5GSJTT5WXqDblQwEiv0wAxLTK', data => { uid => 'v7vHHQQ3XHbgTdFhPd2VgbpXoKC2', username => 'suchi1996.14@gmail.com' }, admin => \1 } );
	my $replyobj = "reply".$rep->getID();
	my $num = $rep->getNumber();
	my $msg = $rep->getMessages();

	my $rid = { number => $num , message => $msg};
	my $result = $fb->put($replyobj ,$rid);

}

sub addReplyInCloud {
   my ( $self, $rep ) = @_;
	my $fb = Firebase->new(firebase => 'marginminder-e6fc0', auth => { secret => 'w0SBCjYMFdHb4wE5GSJTT5WXqDblQwEiv0wAxLTK', data => { uid => 'v7vHHQQ3XHbgTdFhPd2VgbpXoKC2', username => 'suchi1996.14@gmail.com' }, admin => \1 } );
	my $replyobj = "reply".$rep->getID();
	my $num = $rep->getNumber();
	my $msg = $rep->getMessages();

	my $rid = { number => $num , message => $msg};
	my $result = $fb->put_cloud($replyobj ,$rid);

}

1;



#my $fb = Firebase->new(firebase => 'marginminder-e6fc0', auth => { secret => 'w0SBCjYMFdHb4wE5GSJTT5WXqDblQwEiv0wAxLTK', data => { uid => 'v7vHHQQ3XHbgTdFhPd2VgbpXoKC2', username => 'suchi1996.14@gmail.com' }, admin => \1 } );

#my $req = { rid => ""};
#print "debug";
#my $u = "inbox";
#print "debug";
#my $result = $fb->put($u ,$req);

#print "debug";

#<script src="https://www.gstatic.com/firebasejs/4.12.0/firebase.js"></script>
#<script>
 # // Initialize Firebase
  #var config = {
   # apiKey: "AIzaSyAIlOkn2KvU_ybi-zI56B8cR3aUxSVFOww",
    #authDomain: "marginminder-e6fc0.firebaseapp.com",
    #databaseURL: "https://marginminder-e6fc0.firebaseio.com",
    #projectId: "marginminder-e6fc0",
    #storageBucket: "marginminder-e6fc0.appspot.com",
    #messagingSenderId: "496510305372"
  #};
  #firebase.initializeApp(config);

#</script>

