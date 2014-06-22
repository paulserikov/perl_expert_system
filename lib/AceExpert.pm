# Application

package AceExpert;
use Mojo::Base 'Mojolicious';
use Data::Dumper;
use AceExpert::Schema;

# This method will run once at server start
sub startup {
  my $self = shift;
  my $config = $self->plugin('Config');
  warn Dumper $config->{foo};
  my $schema = AceExpert::Schema->connect($config->{dsn}, $config->{user}, $config->{passw});
  $schema->storage->debug(1);
  
  # Router
  my $r = $self->routes;
  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/manage')->to('example#manage');

  $r->get('/api/all_items')->to('example#json_all_items');
  $r->post('/api/add_item')->to('example#add_item');
  $r->post('/api/rename_item')->to('example#rename_item');	# move + rename
  $r->post('/api/delete_item')->to('example#delete_item');
  $r->post('/api/move_item')->to('example#move_item');
}

1;
