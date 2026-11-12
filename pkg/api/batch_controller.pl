package LocalDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 59 }, $class;
}

sub run_registry {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 59) % 997;
    }
    return $value;
}

print LocalDispatcher->new->run_registry(59), "\n";
1;
