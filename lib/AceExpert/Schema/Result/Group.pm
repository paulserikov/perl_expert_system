use utf8;
package AceExpert::Schema::Result::Group;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Group

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<groups>

=cut

__PACKAGE__->table("groups");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 owner

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "owner",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=item * L</owner>

=back

=cut

__PACKAGE__->set_primary_key("id", "owner");

=head1 RELATIONS

=head2 members

Type: has_many

Related object: L<AceExpert::Schema::Result::Member>

=cut

__PACKAGE__->has_many(
  "members",
  "AceExpert::Schema::Result::Member",
  { "foreign.groups_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 owner

Type: belongs_to

Related object: L<AceExpert::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "owner",
  "AceExpert::Schema::Result::User",
  { id => "owner" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 users

Type: many_to_many

Composing rels: L</members> -> user

=cut

__PACKAGE__->many_to_many("users", "members", "user");


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Rgx2YyV5eAlgM6SrWqjYA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
