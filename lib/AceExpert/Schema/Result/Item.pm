use utf8;
package AceExpert::Schema::Result::Item;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Item

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<items>

=cut

__PACKAGE__->table("items");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 created_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "created_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 alternatives_items

Type: has_many

Related object: L<AceExpert::Schema::Result::Alternative>

=cut

__PACKAGE__->has_many(
  "alternatives_items",
  "AceExpert::Schema::Result::Alternative",
  { "foreign.item_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 alternatives_substitutes

Type: has_many

Related object: L<AceExpert::Schema::Result::Alternative>

=cut

__PACKAGE__->has_many(
  "alternatives_substitutes",
  "AceExpert::Schema::Result::Alternative",
  { "foreign.substitute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 bom_item_links

Type: has_many

Related object: L<AceExpert::Schema::Result::BomItemLink>

=cut

__PACKAGE__->has_many(
  "bom_item_links",
  "AceExpert::Schema::Result::BomItemLink",
  { "foreign.items_id" => "self.id" },
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 pictures

Type: has_many

Related object: L<AceExpert::Schema::Result::Picture>

=cut

__PACKAGE__->has_many(
  "pictures",
  "AceExpert::Schema::Result::Picture",
  { "foreign.items_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 shop_links

Type: has_many

Related object: L<AceExpert::Schema::Result::ShopLink>

=cut

__PACKAGE__->has_many(
  "shop_links",
  "AceExpert::Schema::Result::ShopLink",
  { "foreign.items_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z3KRC7sA3kp17/STpGs5sQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
