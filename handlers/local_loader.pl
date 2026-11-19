package SharedBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 94 }, $class;
}

sub fetch_router {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 94) % 997;
    }
    return $total;
}

print SharedBuffer->new->fetch_router(94), "\n";
1;
