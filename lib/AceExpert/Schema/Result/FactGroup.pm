use utf8;
package AceExpert::Schema::Result::FactGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::FactGroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<fact_groups>

=cut

__PACKAGE__->table("fact_groups");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fact_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 group_shortname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fact_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "group_shortname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 fact

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Fact>

=cut

__PACKAGE__->belongs_to(
  "fact",
  "AceExpert::Schema::Result::Fact",
  { id => "fact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 rules_group_actions

Type: has_many

Related object: L<AceExpert::Schema::Result::Rule>

=cut

__PACKAGE__->has_many(
  "rules_group_actions",
  "AceExpert::Schema::Result::Rule",
  { "foreign.group_action" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 rules_group_conditions

Type: has_many

Related object: L<AceExpert::Schema::Result::Rule>

=cut

__PACKAGE__->has_many(
  "rules_group_conditions",
  "AceExpert::Schema::Result::Rule",
  { "foreign.group_condition" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 15:17:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hlg6lNaysd8a1iNWutqMwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
