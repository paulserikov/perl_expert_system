How to deploy:
1) install DBIx::Class, Mojo, JSON
2) change settings in ace_expert.conf
3) go to <project_domain>/deploy
4) have fun

How to develop:
1) install MySQL Workbench
2) open db.mwb, make changes, commit them via forward engineer tool.
note that schema name must match with server database name
3) to migrate database changings into Perl classes for using in data retry with DBIx::Class
run ./make_orm.sh. It will update module /lib/AceExpert/Schema
4) make changes in controllers (/lib)
5) don't forget to commit them
6) have fun

To project DB correctly it can help:
http://hitechnotes.blogspot.ru/2014/05/blog-post.html