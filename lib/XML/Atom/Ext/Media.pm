package XML::Atom::Ext::Media;
# ABSTRACT: An XML::Atom extenstion for the yahoo Media RSS extension

use strict;
use warnings;

use base qw( XML::Atom::Base );

use XML::Atom::Feed;

use XML::Atom::Ext::Media::Group;
use XML::Atom::Ext::Media::Content;
use XML::Atom::Ext::Media::Thumbnail;

BEGIN {
#    XML::Atom::Feed->mk_elem_accessors(
#        qw(totalResults startIndex itemsPerPage),
#        [   XML::Atom::Namespace->new(
#                "opensearch" => q{http://a9.com/-/spec/opensearch/1.1/}
#            )
#        ]
#    );

    XML::Atom::Entry->mk_object_list_accessor(
        group => 'XML::Atom::Ext::Media::Group',
        'media_groups',
    );
# XXX: This conflicts with <entry><content>, how to restrict to NS?
#    XML::Atom::Entry->mk_object_list_accessor(
#        content => 'XML::Atom::Ext::Media::Content'
#    );
}



sub element_ns {
     return XML::Atom::Namespace->new(
        "media" => q{http://search.yahoo.com/mrss/} 
    );
}
1;