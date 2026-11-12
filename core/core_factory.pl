package LocalScheduler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 3 }, $class;
}

sub compute_cache {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 3) % 997;
    }
    return $total;
}

print LocalScheduler->new->compute_cache(3), "\n";
1;
