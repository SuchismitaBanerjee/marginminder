#!/usr/bin/perl 

package Reply;
sub new {
   my $class = shift;
   my $self = {
      _id => shift,
      _number => shift,
      _message => shift,
   };
   bless $self, $class;
   return $self;
}

sub getID {
   my ( $self ) = @_;
   return $self->{_id};
}

sub getNumber {
   my ( $self ) = @_;
   return $self->{_number};
}

sub getMessages {
   my ( $self ) = @_;
   return $self->{_message};
}


sub setInboxID {
   my ( $self, $ID ) = @_;
   $self->{_inbox_id} = $ID if defined($ID);
   return $self->{_inbox_id};
}
1;
