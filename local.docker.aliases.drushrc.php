<?php
// Parent alias to be used for local development docker containers.
// Aliases file name that will be in the docker container folder:
// .home-localdev/.drush/docker.aliases.drushrc.php
//
// Add something like the code below to the aliases file to use all these
// settings for the alias you are creating. Most likely this will be "dev".
//
// <?php
// $aliases['dev'] = array(
//  'parent' => '@docker.localdev',
// );
//
// This alias can also be used directly to access the container running
// in the all_container mode, like this:
// drush @docker.localdev ssh
// Other drush commands can be run in a similar way.

$aliases['localdev'] = array(
  'root' => '/var/www',
  'remote-user' => 'root',
  'remote-host' => 'localdevdrupal',
  'ssh-options' => '-p 22', // Or any other port you specify when running the container
  'path-aliases' => array(
    '%dump' => '/tmp/aaa-tmp/localdev-sql-dump.sql',
    '%files' => 'sites/default/files',
  ),
  'target-command-specific' => array(
    'sql-sync' => array(
      'no-ordered-dump' => TRUE,
      'no-cache' => TRUE,
      'enable' => array(
        'devel',
        'stage_file_proxy',
        'ds_ui',
        'fields_ui',
        'views_ui',
      ),
    ),
  ),
);
