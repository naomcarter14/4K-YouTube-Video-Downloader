package AsyncRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 14 }, $class;
}

sub resolve_parser {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 14) % 997;
    }
    return $count;
}

print AsyncRegistry->new->resolve_parser(14), "\n";
1;
