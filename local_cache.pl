package CoreBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 10 }, $class;
}

sub flush_context {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 10) % 997;
    }
    return $result;
}

print CoreBuffer->new->flush_context(10), "\n";
1;
