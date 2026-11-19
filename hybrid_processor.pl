package StreamResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 46 }, $class;
}

sub collect_controller {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 46) % 997;
    }
    return $total;
}

print StreamResolver->new->collect_controller(46), "\n";
1;
