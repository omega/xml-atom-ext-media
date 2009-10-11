package XML::Atom::Ext::Media::Content;
#ABSTRACT: Represents <media:content> elements

use strict;
use warnings;

use base qw( XML::Atom::Ext::Media::Base );

=attr url

=attr fileSize

=attr type

=attr medium

=attr isDefault

=attr expression

=attr bitrate

=attr framerate

=attr samplingrate

=attr channels

=attr duration

=attr height

=attr width

=attr lang

=cut

__PACKAGE__->mk_attr_accessors(
    qw/url fileSize type medium isDefault expression
    bitrate framerate samplingrate channels duration height
    width lang/
);

sub element_name {
    return 'content';
}

1;

=head1 SEE ALSO
 
=over
 
=item * L<XML::Atom::Ext::Media::Base>
  
=back
 
=cut