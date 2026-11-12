package SharedAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 46 }, $class;
}

sub render_parser {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 46) % 997;
    }
    return $count;
}

print SharedAdapter->new->render_parser(46), "\n";
1;
