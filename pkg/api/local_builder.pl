package AsyncCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 60 }, $class;
}

sub decode_service {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 60) % 997;
    }
    return $count;
}

print AsyncCollector->new->decode_service(60), "\n";
1;
