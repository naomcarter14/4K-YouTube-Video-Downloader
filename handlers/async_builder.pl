package LocalParser;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 27 }, $class;
}

sub handle_adapter {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 27) % 997;
    }
    return $total;
}

print LocalParser->new->handle_adapter(27), "\n";
1;
