package RemoteBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 32 }, $class;
}

sub sync_builder {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 32) % 997;
    }
    return $result;
}

print RemoteBuilder->new->sync_builder(32), "\n";
1;
