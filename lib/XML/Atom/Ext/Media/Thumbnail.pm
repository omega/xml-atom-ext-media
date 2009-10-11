package XML::Atom::Ext::Media::Thumbnail;
#ABSTRACT: Represents <media:thumbnail> elements

use strict;
use warnings;

use base qw( XML::Atom::Base );

=attr url

=attr height

=attr width

=attr time

=cut

__PACKAGE__->mk_attr_accessors(qw/url height width time/);

=attr element_ns

Returns our L<XML::Atom::Namespace> object, akin to L<XML::Atom::Ext::Media/element_ns>

=cut

sub element_ns {
    return XML::Atom::Ext::Media->element_ns;
}

=attr element_name

Implemented in the subclasses.

Returns the name of the namespaced element we represent, like group for <media:group>

=cut

sub element_name {
    return 'thumbnail';
}

1;
__END__
