use utf8;
package AceExpert::Schema::Result::Value;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Value

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<values>

=cut

__PACKAGE__->table("values");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 human_name

  data_type: 'varchar'
  is_nullable: 1
  size: 160

=head2 warnings

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "human_name",
  { data_type => "varchar", is_nullable => 1, size => 160 },
  "warnings",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 attributes_has_values

Type: has_many

Related object: L<AceExpert::Schema::Result::AttributesHasValue>

=cut

__PACKAGE__->has_many(
  "attributes_has_values",
  "AceExpert::Schema::Result::AttributesHasValue",
  { "foreign.values_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 facts

Type: has_many

Related object: L<AceExpert::Schema::Result::Fact>

=cut

__PACKAGE__->has_many(
  "facts",
  "AceExpert::Schema::Result::Fact",
  { "foreign.val_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 attributes

Type: many_to_many

Composing rels: L</attributes_has_values> -> attribute

=cut

__PACKAGE__->many_to_many("attributes", "attributes_has_values", "attribute");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fLnO91ugQshFbghYH/jJug


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
