use utf8;
package AceExpert::Schema::Result::Member;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

AceExpert::Schema::Result::Member

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<members>

=cut

__PACKAGE__->table("members");

=head1 ACCESSORS

=head2 users_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 groups_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "users_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "groups_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</users_id>

=item * L</groups_id>

=back

=cut

__PACKAGE__->set_primary_key("users_id", "groups_id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<AceExpert::Schema::Result::Group>

=cut

__PACKAGE__->belongs_to(
  "group",
  "AceExpert::Schema::Result::Group",
  { id => "groups_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<AceExpert::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "AceExpert::Schema::Result::User",
  { id => "users_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-06-22 12:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5xDWy6N3diTmOX4wtVcX4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
