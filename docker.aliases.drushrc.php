<?php
// Parent alias to be used for local development docker containers.
// Aliases file name will look something like this:
// environmentname.aliases.drushrc.php
//
// Add something like the code below to the aliases file to use all these
// settings for the alias you are creating. Most likely this will be "dev".
//
// <?php
// $aliases['dev'] = array(
//  'parent' => '@docker.localdev',
//  'uri' => 'environmentname.docker',
// );

$aliases['localdev'] = array(
  'root' => '/var/www',
  'remote-user' => 'root',
  'remote-host' => 'localhost',
  'ssh-options' => '-p 9022', // Or any other port you specify when running the container
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
/* $aliases['hamburger'] = array(
  'root' => '/var/www',
  'remote-user' => 'root',
  'remote-host' => 'localhost',
  'ssh-options' => '-p 9022', // Or any other port you specify when running the container
  'target-command-specific' => array(
    'sql-sync' => array(
      'sanitize' => TRUE,
      'confirm-sanitizations' => TRUE,
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
*/
