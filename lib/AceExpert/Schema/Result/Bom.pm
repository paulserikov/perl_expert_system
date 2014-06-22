use utf8;
package AceExpert::Schema::Result::Bom;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Bom

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<boms>

=cut

__PACKAGE__->table("boms");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 created_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 permission_mask

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "created_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "permission_mask",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 bom_item_links

Type: has_many

Related object: L<AceExpert::Schema::Result::BomItemLink>

=cut

__PACKAGE__->has_many(
  "bom_item_links",
  "AceExpert::Schema::Result::BomItemLink",
  { "foreign.boms_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 created_by

Type: belongs_to

Related object: L<AceExpert::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "created_by",
  "AceExpert::Schema::Result::User",
  { id => "created_by" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tafUqMrNQnjQLpmGYkVcLA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
