package XML::Atom::Ext::Media::Content;

use strict;
use warnings;

use base qw( XML::Atom::Ext::Media::Base );

__PACKAGE__->mk_attr_accessors(
    qw/url fileSize type medium isDefault expression
    bitrate framerate samplingrate channels duration height
    width lang/
);

sub element_name {
    return 'content';
}

1;