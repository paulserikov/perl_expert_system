use utf8;
package AceExpert::Schema::Result::Part;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Part

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<parts>

=cut

__PACKAGE__->table("parts");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 parent_id

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "parent_id",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

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
  { "foreign.parts_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 attributes

Type: many_to_many

Composing rels: L</parts_has_attributes> -> attribute

=cut

__PACKAGE__->many_to_many("attributes", "parts_has_attributes", "attribute");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PN67PhJHinB4lzJ+sDwPnA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
