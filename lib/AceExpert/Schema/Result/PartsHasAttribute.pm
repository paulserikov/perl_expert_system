use utf8;
package AceExpert::Schema::Result::PartsHasAttribute;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::PartsHasAttribute

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<parts_has_attributes>

=cut

__PACKAGE__->table("parts_has_attributes");

=head1 ACCESSORS

=head2 parts_id

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 attributes_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "parts_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "attributes_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</parts_id>

=item * L</attributes_id>

=back

=cut

__PACKAGE__->set_primary_key("parts_id", "attributes_id");

=head1 RELATIONS

=head2 attribute

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Attribute>

=cut

__PACKAGE__->belongs_to(
  "attribute",
  "AceExpert::Schema::Result::Attribute",
  { id => "attributes_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 part

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Part>

=cut

__PACKAGE__->belongs_to(
  "part",
  "AceExpert::Schema::Result::Part",
  { id => "parts_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wPbYTYHb4S158H5C2cfw4A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
