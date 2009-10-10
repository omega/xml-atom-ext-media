package XML::Atom::Ext::Media::Base;

#ABSTRACT: Stuff shared between group and content

use strict;
use warnings;

use base qw( XML::Atom::Base );

__PACKAGE__->mk_elem_accessors(qw(title description keywords));
__PACKAGE__->mk_object_list_accessor(
    thumbnail => 'XML::Atom::Ext::Media::Thumbnail', 'thumbnails',
);
__PACKAGE__->mk_object_list_accessor(
    'category' => 'XML::Atom::Category', 'categories'
);
sub element_ns {
    return XML::Atom::Ext::Media->element_ns;
}


1;