<?php
$aliases['dev'] = array(
  'root' => '/var/www',
  'remote-user' => 'root',
  'remote-host' => 'localdevdrupal', // Docker container hostname from docker-compose.yml
  'ssh-options' => '', // Or any other port you specify when running the container -p 9022
  'path-aliases' => array(
    '%files' => 'sites/default/files', 
    ),
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
$aliases['test'] = array(
  'root' => '',
  'remote-user' => '',
  'remote-host' => '',
  'ssh-options' => '',    // port number ie. -p 22
  'path-aliases' => array(
    '%files' => 'sites/default/files',
    '%dump-dir' => 'sql-sync-tmp  ', 
    ),
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
$aliases['live'] = array(
  'root' => '',
  'remote-user' => '',
  'remote-host' => '',
  'ssh-options' => '',    // port number ie. -p 22
  'path-aliases' => array(
    '%files' => 'sites/default/files',
    '%dump-dir' => 'sql-sync-tmp  ', 
    ),
  'target-command-specific' => array(
    'sql-sync' => array(
      'sanitize' => TRUE,
      'confirm-sanitizations' => TRUE,
      'no-ordered-dump' => TRUE,
      'no-cache' => TRUE,
    ),
  ),
);
