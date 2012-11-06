package XML::Atom::Ext::Media;
# ABSTRACT: An XML::Atom extenstion for the yahoo Media RSS extension

use strict;
use warnings;

use base qw( XML::Atom::Base );

use XML::Atom::Feed;

use XML::Atom::Ext::Media::Group;
use XML::Atom::Ext::Media::Content;
use XML::Atom::Ext::Media::Thumbnail;


=attr media

Will look for any elements of the type <media:group> (as long as 
xmlns:media='http://search.yahoo.com/mrss/').

In SCALAR context it will return the first sich element, in list context
it will return all such elements as a list.

=attr media_groups

Like L<media>, but will return a array ref in SCALAR context, and the list
in list context.

=cut

BEGIN {
    XML::Atom::Entry->mk_object_list_accessor(
        group => 'XML::Atom::Ext::Media::Group',
        'media_groups',
    );

    XML::Atom::Entry->mk_object_list_accessor(
        media_content => 'XML::Atom::Ext::Media::Content'
    );

    XML::Atom::Entry->mk_object_list_accessor(
        thumbnail => 'XML::Atom::Ext::Media::Thumbnail'
    );
}

=attr element_ns

Returns the L<XML::Atom::Namespace> object representing our
xmlns:media="http://search.yahoo.com/mrss/">.

=cut

sub element_ns {
     return XML::Atom::Namespace->new(
        "media" => q{http://search.yahoo.com/mrss/} 
    );
}

1;

__END__

=head1 DESCRIPTION

A for the moment rather crude and simple module for handeling MRSS elements

=head1 SYNOPSIS

    use XML::Atom::Feed;
    use XML::Atom::Ext::Media;
    
    my $feed = XML::Atom::Feed->new(
        URI->new('http://gdata.youtube.com/feeds/api/users/andreasmarienborg/uploads')
    );
    
    my ($entry) = $feed->entries;
    my ($media) = $entry->media_groups;
    my $content = $media->default_content;
    my $thumb_url = $media->thumbnail->url;


=head1 IMPLEMENTATION

The L<ATTRIBUTES> we describe here end up on L<XML::Atom::Entry>-objects, except
for L<element_ns>.

=head1 ACKNOWLEDGEMENTS

Thank you to L<XML::Atom::Ext::OpenSearch> for being invaluable aid in figuring out
how to write extension for L<XML::Atom>. Thank you to MIYAGAWA for L<XML::Atom>.
