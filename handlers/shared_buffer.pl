package LocalCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 20 }, $class;
}

sub encode_monitor {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 20) % 997;
    }
    return $value;
}

print LocalCollector->new->encode_monitor(20), "\n";
1;
