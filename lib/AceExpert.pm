# Application

package AceExpert;
use Mojo::Base 'Mojolicious';
use Data::Dumper;
use AceExpert::Schema;

# Adding own method to app

has dbh => sub {
  my $self = shift;
  my $login = $self->plugin('Config')->{login};
  my $password = $self->plugin('Config')->{password};
  my $database = $self->plugin('Config')->{database};
  my $host = $self->plugin('Config')->{host};
  my $port = $self->plugin('Config')->{port};
  my $db_type = $self->plugin('Config')->{db_type};
  my $dsn = "dbi:$db_type:database=$database;host=$host;port=$port";
  my $db_connection = AceExpert::Schema->connect($dsn, $login, $password);
  return $db_connection;
};


sub startup {
  my $self = shift;
  my $r = $self->routes;
  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/manage')->to('example#manage');

  $r->get('/api/all_items')->to('example#all_items_json');
  $r->post('/api/add_item')->to('example#add_item');
  $r->post('/api/rename_item')->to('example#rename_item');	# move + rename
  $r->post('/api/delete_item')->to('example#delete_item');
  $r->post('/api/move_item')->to('example#move_item');
}

1;
