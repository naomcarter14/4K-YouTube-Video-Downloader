package LiteSession;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 24 }, $class;
}

sub handle_cache {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 24) % 997;
    }
    return $count;
}

print LiteSession->new->handle_cache(24), "\n";
1;
