use utf8;
package AceExpert::Schema::Result::Attribute;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Attribute

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<attributes>

=cut

__PACKAGE__->table("attributes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 160

=head2 question

  data_type: 'varchar'
  is_nullable: 1
  size: 160

=head2 is_subjective

  data_type: 'integer'
  is_nullable: 1

=head2 has_binary_values

  data_type: 'integer'
  is_nullable: 1

=head2 is_goal

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 160 },
  "question",
  { data_type => "varchar", is_nullable => 1, size => 160 },
  "is_subjective",
  { data_type => "integer", is_nullable => 1 },
  "has_binary_values",
  { data_type => "integer", is_nullable => 1 },
  "is_goal",
  { data_type => "integer", is_nullable => 1 },
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
  { "foreign.attributes_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 facts

Type: has_many

Related object: L<AceExpert::Schema::Result::Fact>

=cut

__PACKAGE__->has_many(
  "facts",
  "AceExpert::Schema::Result::Fact",
  { "foreign.part_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parts_has_attributes

Type: has_many

Related object: L<AceExpert::Schema::Result::PartsHasAttribute>

=cut

__PACKAGE__->has_many(
  "parts_has_attributes",
  "AceExpert::Schema::Result::PartsHasAttribute",
  { "foreign.attributes_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parts

Type: many_to_many

Composing rels: L</parts_has_attributes> -> part

=cut

__PACKAGE__->many_to_many("parts", "parts_has_attributes", "part");

=head2 values

Type: many_to_many

Composing rels: L</attributes_has_values> -> value

=cut

__PACKAGE__->many_to_many("values", "attributes_has_values", "value");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iJP+AAf20gFXV1ym6exUjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
