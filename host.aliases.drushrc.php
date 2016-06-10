<?php
$aliases['dev'] = array(
  'parent' => '@docker.localdev',
  'path-aliases' => array(
    '%files' => 'sites/default/files', 
    ),
  'target-command-specific' => array(
    'sql-sync' => array(
//      'sanitize' => TRUE,
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
  'source-command-specific' => array(
  'sql-sync'  => array(
    'http-sync'  => 'http://example.com/dbouthouse/example-database-dump.sql.gz',
    'http-sync-user' => 'username',
    'http-sync-password' => 'password',
    ),
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
    '%dump-dir' => 'sql-sync-tmp', 
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
// TLDR; MAGIC STARTS HERE.
//
// Remove "remote-host" from entries that correspond with the current server.
// This allows us to use the same alias file in all environments.
$ip = gethostbyname(php_uname('n'));
foreach ($aliases as &$alias) {
  if (empty($alias['remote-host'])) {
    continue;
  }
  if (gethostbyname($alias['remote-host']) == $ip) {
    unset($alias['remote-host']);
  }
}
