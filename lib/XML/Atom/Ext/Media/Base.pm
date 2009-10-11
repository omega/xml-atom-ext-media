package XML::Atom::Ext::Media::Base;
#ABSTRACT: Stuff shared between group and content

use strict;
use warnings;

use base qw( XML::Atom::Base );

=attr title

Returns the title for a <media:group> or <media:content>

=attr description

Returns the description for a <media:group> or <media:content>

=attr keywords

Returns the keywords string for a <media:group> or <media:content>

=cut

__PACKAGE__->mk_elem_accessors(qw(title description keywords));

=attr thumbnail

In SCALAR context it returns the first <media:thumbnail> we find in
this <media:group> or <media:content>.

In LIST context it will return all of them.

=attr thumbnails

Like L<thumbnail>, but will in SCALAR context return an arrayref.

=cut

__PACKAGE__->mk_object_list_accessor(
    thumbnail => 'XML::Atom::Ext::Media::Thumbnail', 'thumbnails',
);

=attr category

Will in SCALAR context return the first <media:category> as an
L<XML::Atom::Category>, and will in LIST context return an array
of all such objects.

=attr categories

Will return an ARRAYREF in SCALAR context, otherwise like L<category>

=cut

__PACKAGE__->mk_object_list_accessor(
    'category' => 'XML::Atom::Category', 'categories'
);

=attr element_ns

Returns the namescpare for this node, the same as for
L<XML::Atom::Ext::Media/element_ns>.

=attr element_name

Implemented in the subclasses.

Returns the name of the namespaced element we represent, like group for <media:group>

=cut

sub element_ns {
    return XML::Atom::Ext::Media->element_ns;
}


1;
__END__

=head1 CLASSES THAT INHERIT US
 
=over
 
=item * L<XML::Atom::Ext::Media::Group>

=item * L<XML::Atom::Ext::Media::Content>
  
=back
 
=cut