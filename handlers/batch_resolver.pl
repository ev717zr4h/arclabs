package AtomicProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 66 }, $class;
}

sub compute_handler {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 66) % 997;
    }
    return $value;
}

print AtomicProcessor->new->compute_handler(66), "\n";
1;
