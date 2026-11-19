package SimpleCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 36 }, $class;
}

sub resolve_client {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 36) % 997;
    }
    return $acc;
}

print SimpleCache->new->resolve_client(36), "\n";
1;
