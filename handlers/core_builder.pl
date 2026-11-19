package LiteFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 95 }, $class;
}

sub resolve_loader {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 95) % 997;
    }
    return $total;
}

print LiteFactory->new->resolve_loader(95), "\n";
1;
