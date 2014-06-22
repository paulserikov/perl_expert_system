use utf8;
package AceExpert::Schema::Result::Fact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Fact

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<facts>

=cut

__PACKAGE__->table("facts");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 part_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 attr_id

  data_type: 'integer'
  is_nullable: 1

=head2 val_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "part_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "attr_id",
  { data_type => "integer", is_nullable => 1 },
  "val_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 fact_groups

Type: has_many

Related object: L<AceExpert::Schema::Result::FactGroup>

=cut

__PACKAGE__->has_many(
  "fact_groups",
  "AceExpert::Schema::Result::FactGroup",
  { "foreign.fact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 part

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Part>

=cut

__PACKAGE__->belongs_to(
  "part",
  "AceExpert::Schema::Result::Part",
  { id => "part_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 part_2

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Attribute>

=cut

__PACKAGE__->belongs_to(
  "part_2",
  "AceExpert::Schema::Result::Attribute",
  { id => "part_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 val

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Value>

=cut

__PACKAGE__->belongs_to(
  "val",
  "AceExpert::Schema::Result::Value",
  { id => "val_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hZ9Cu5mOxOakgISfg33RTA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
