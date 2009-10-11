package XML::Atom::Ext::Media::Group;
#ABSTRACT: Represents <media:grouå> elements

use strict;
use warnings;

use base qw( XML::Atom::Ext::Media::Base );

=attr content

Returns the first L<XML::Atom::Ext::Media::Content> object in SCALAR context,
or a list of them in LIST context.

=attr contents

Returns a ARRAYREF in SCALAR context and otherwise behaves like L<content>

=cut

__PACKAGE__->mk_object_list_accessor(
    content => 'XML::Atom::Ext::Media::Content', 'contents' 
);

=method default_content

Will look through L</contents> for any element that
returns true for isDefault. If no such element is found,
it will return the first element in L</contents>

=cut

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

=head1 SEE ALSO
 
=over
 
=item * L<XML::Atom::Ext::Media::Base>
  
=back
 
=cut
