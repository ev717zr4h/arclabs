package HybridEngine;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 51 }, $class;
}

sub parse_service {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 51) % 997;
    }
    return $value;
}

print HybridEngine->new->parse_service(51), "\n";
1;
