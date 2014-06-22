use utf8;
package AceExpert::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 lname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 1

=head2 organisation

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "lname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 1,
  },
  "organisation",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 alternatives

Type: has_many

Related object: L<AceExpert::Schema::Result::Alternative>

=cut

__PACKAGE__->has_many(
  "alternatives",
  "AceExpert::Schema::Result::Alternative",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 boms

Type: has_many

Related object: L<AceExpert::Schema::Result::Bom>

=cut

__PACKAGE__->has_many(
  "boms",
  "AceExpert::Schema::Result::Bom",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 groups_2s

Type: has_many

Related object: L<AceExpert::Schema::Result::Group>

=cut

__PACKAGE__->has_many(
  "groups_2s",
  "AceExpert::Schema::Result::Group",
  { "foreign.owner" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items

Type: has_many

Related object: L<AceExpert::Schema::Result::Item>

=cut

__PACKAGE__->has_many(
  "items",
  "AceExpert::Schema::Result::Item",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 members

Type: has_many

Related object: L<AceExpert::Schema::Result::Member>

=cut

__PACKAGE__->has_many(
  "members",
  "AceExpert::Schema::Result::Member",
  { "foreign.users_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pictures

Type: has_many

Related object: L<AceExpert::Schema::Result::Picture>

=cut

__PACKAGE__->has_many(
  "pictures",
  "AceExpert::Schema::Result::Picture",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 shop_links

Type: has_many

Related object: L<AceExpert::Schema::Result::ShopLink>

=cut

__PACKAGE__->has_many(
  "shop_links",
  "AceExpert::Schema::Result::ShopLink",
  { "foreign.created_by" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 groups

Type: many_to_many

Composing rels: L</members> -> group

=cut

__PACKAGE__->many_to_many("groups", "members", "group");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:THPSIM4CgcgqEwSOhRHCNQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
