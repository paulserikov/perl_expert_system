use utf8;
package AceExpert::Schema::Result::BomItemLink;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::BomItemLink

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<bom_item_links>

=cut

__PACKAGE__->table("bom_item_links");

=head1 ACCESSORS

=head2 boms_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 items_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 count_plan

  data_type: 'integer'
  is_nullable: 1

=head2 count_fact

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "boms_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "items_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "count_plan",
  { data_type => "integer", is_nullable => 1 },
  "count_fact",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</boms_id>

=item * L</items_id>

=back

=cut

__PACKAGE__->set_primary_key("boms_id", "items_id");

=head1 RELATIONS

=head2 bom

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Bom>

=cut

__PACKAGE__->belongs_to(
  "bom",
  "AceExpert::Schema::Result::Bom",
  { id => "boms_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 item

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "item",
  "AceExpert::Schema::Result::Item",
  { id => "items_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C8Ht9XXvbhHqC3Vb7lO9Zg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
