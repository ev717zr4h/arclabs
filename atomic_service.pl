package AsyncGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 16 }, $class;
}

sub render_registry {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 16) % 997;
    }
    return $total;
}

print AsyncGateway->new->render_registry(16), "\n";
1;
