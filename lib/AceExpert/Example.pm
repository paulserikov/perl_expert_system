package AceExpert::Example;
use Mojo::Base 'Mojolicious::Controller';
use AceExpert::Schema;
use DBIx::Error;
use Data::Dumper;
# my $schema = \&connect_db();

sub connect_db {
	my $self = shift;
	warn Dumper $self;
	my $login = $self->app->plugin('Config')->{login};
  	my $password = $self->app->plugin('Config')->{password};
  	my $database = $self->app->plugin('Config')->{database};
  	my $host = $self->app->plugin('Config')->{host};
  	my $port = $self->app->plugin('Config')->{port};
  	my $db_type = $self->app->plugin('Config')->{db_type};
  	my $dsn = "dbi:$db_type:database=$database;host=$host;port=$port";
  	my $db_connection = SocialBom::Schema->connect($dsn, $login, $password, { HandleError => DBIx::Error->HandleError, ShowErrorStatement => 1 });
  	return $db_connection;
}

sub welcome {
  my $self = shift;
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

sub manage	{
	my $self = shift;
	$self->render();
}

sub json_all_items {
	my $self = shift;
	my @all_parts=();
	my $temp_hash = {};
	my $parent_id;
	my $schema = \&connect_db();
	my $all_parts_rs = $schema->resultset('Part');
	while(my $part = $all_parts_rs->next) { 
	 	$temp_hash->{'id'} = $part->id;
	 	$temp_hash->{'text'} = $part->name;
	 	if ($part->parent_id == "null") {
	 		$parent_id="#";
	 	} else {
			$parent_id = $part->parent_id;
	 	}
	 	$temp_hash->{'parent'} = $parent_id;
	 	push(@all_parts, $temp_hash);
	 	$temp_hash = {};
	 }
	$self->render(
		json => \@all_parts
		);
}

sub add_item {
	my $self = shift;
	my $schema = \&connect_db();
	my $request = $self->req->params->to_hash;
	warn Dumper $request;
	my $new_item = $schema->resultset('Part')->new({ name => $request->{'name'}, parent_id => $request->{'parent_id'} });
	$new_item->insert;
}

sub rename_item {
	my $self = shift;
	my $schema = \&connect_db();
	my $request = $self->req->params->to_hash;
	warn Dumper $request;
	$schema->resultset('Part')->search({ id => $request->{'node_id'} })->update({ name => $request->{'new_name'} });
}

sub delete_item {
	my $self = shift;
	my $schema = \&connect_db();
	my $request = $self->req->params->to_hash;
	warn Dumper $request;
	$schema->resultset('Part')->search({ id => $request->{'node_id'} })->delete_all;
}

sub move_item {
	my $self = shift;
	my $schema = \&connect_db();
	my $request = $self->req->params->to_hash;
	warn Dumper $request;
	$schema->resultset('Part')->search({ id => $request->{'node_id'} })->update({ parent_id => $request->{'new_parent'} });
}




1;
