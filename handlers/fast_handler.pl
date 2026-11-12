package SimpleProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 38 }, $class;
}

sub resolve_handler {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 38) % 997;
    }
    return $value;
}

print SimpleProcessor->new->resolve_handler(38), "\n";
1;
