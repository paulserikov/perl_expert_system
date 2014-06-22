use utf8;
package AceExpert::Schema::Result::AttributesHasValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::AttributesHasValue

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<attributes_has_values>

=cut

__PACKAGE__->table("attributes_has_values");

=head1 ACCESSORS

=head2 attributes_id

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 values_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "attributes_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "values_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</attributes_id>

=item * L</values_id>

=back

=cut

__PACKAGE__->set_primary_key("attributes_id", "values_id");

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

=head2 value

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Value>

=cut

__PACKAGE__->belongs_to(
  "value",
  "AceExpert::Schema::Result::Value",
  { id => "values_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DYdp/zOs3pVHyo4dnHIk1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
