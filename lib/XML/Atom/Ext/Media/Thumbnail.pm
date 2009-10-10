package XML::Atom::Ext::Media::Thumbnail;

use strict;
use warnings;

use base qw( XML::Atom::Base );

__PACKAGE__->mk_attr_accessors(qw/url height width time/);

sub element_ns {
    return XML::Atom::Ext::Media->element_ns;
}
sub element_name {
    return 'thumbnail';
}

1;