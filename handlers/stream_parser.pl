package DynamicResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 54 }, $class;
}

sub render_registry {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 54) % 997;
    }
    return $result;
}

print DynamicResolver->new->render_registry(54), "\n";
1;
