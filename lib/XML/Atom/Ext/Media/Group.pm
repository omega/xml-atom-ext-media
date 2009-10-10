package XML::Atom::Ext::Media::Group;

use strict;
use warnings;

use base qw( XML::Atom::Ext::Media::Base );

__PACKAGE__->mk_object_list_accessor(
    content => 'XML::Atom::Ext::Media::Content', 'contents' 
);

sub default_content {
    my ($self) = @_;
    
    my @contents = $self->contents;
    foreach (@contents) {
        return $_ if $_->isDefault;
    }
    # Fallback to the first one
    return $contents[0];
}
sub element_name {
    return 'group';
}

1;