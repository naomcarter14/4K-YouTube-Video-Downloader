package StreamManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 89 }, $class;
}

sub decode_factory {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 89) % 997;
    }
    return $result;
}

print StreamManager->new->decode_factory(89), "\n";
1;
