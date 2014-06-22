use utf8;
package AceExpert::Schema::Result::Rule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Rule

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<rules>

=cut

__PACKAGE__->table("rules");

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

=head2 source

  data_type: 'varchar'
  is_nullable: 1
  size: 160

=head2 group_condition

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 group_action

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 160 },
  "source",
  { data_type => "varchar", is_nullable => 1, size => 160 },
  "group_condition",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "group_action",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 group_action

Type: belongs_to

Related object: L<AceExpert::Schema::Result::FactGroup>

=cut

__PACKAGE__->belongs_to(
  "group_action",
  "AceExpert::Schema::Result::FactGroup",
  { id => "group_action" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 group_condition

Type: belongs_to

Related object: L<AceExpert::Schema::Result::FactGroup>

=cut

__PACKAGE__->belongs_to(
  "group_condition",
  "AceExpert::Schema::Result::FactGroup",
  { id => "group_condition" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KCLpZsuRcoFB0d2WD2ikuQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
