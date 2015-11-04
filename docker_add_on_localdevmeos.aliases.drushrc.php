<?php
$aliases['dev'] = array(
  'root' => '/var/www',
  'remote-user' => 'root',
  'remote-host' => 'localdevmeos_localdevdrupal_1',
  'ssh-options' => '-p 22', // Or any other port you specify when running the container
  'path-aliases' => array(
    '%files' => 'sites/default/files',
    ),  
);
