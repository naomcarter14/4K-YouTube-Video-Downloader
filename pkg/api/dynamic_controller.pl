package AsyncParser;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 63 }, $class;
}

sub decode_gateway {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 63) % 997;
    }
    return $total;
}

print AsyncParser->new->decode_gateway(63), "\n";
1;
