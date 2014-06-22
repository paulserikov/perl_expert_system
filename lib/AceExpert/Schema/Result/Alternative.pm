use utf8;
package AceExpert::Schema::Result::Alternative;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Alternative

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<alternatives>

=cut

__PACKAGE__->table("alternatives");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 substitute_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_by

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "item_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "substitute_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_by",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=item * L</item_id>

=item * L</substitute_id>

=back

=cut

__PACKAGE__->set_primary_key("id", "item_id", "substitute_id");

=head1 RELATIONS

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

=head2 item

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "item",
  "AceExpert::Schema::Result::Item",
  { id => "item_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 substitute

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "substitute",
  "AceExpert::Schema::Result::Item",
  { id => "substitute_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ETrtlM//hDwGicIEjgrNXA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
