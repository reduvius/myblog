<?php

use MyBlog\Core\Router;
use MyBlog\Core\Request;
use MyBlog\Core\Config;
use MyBlog\Utils\DependencyInjector;
use	Monolog\Logger;
use	Monolog\Handler\StreamHandler;

require_once __DIR__ . '/vendor/autoload.php';

$config = new Config();
$dbConfig = $config->get('db');

$db = new PDO(
    'mysql:host=127.0.0.1;dbname=myblog',
    $dbConfig['user'],
    $dbConfig['password']
);

$loader = new Twig_Loader_Filesystem(__DIR__ . '/src/views');
$view = new Twig_Environment($loader);

$log = new Logger('myblog');
$logFile = $config->get('log');
$log->pushHandler(new StreamHandler($logFile, Logger::DEBUG));

$di = new DependencyInjector();
$di->set('PDO', $db);
$di->set('Config', $config);
$di->set('Twig_Environment', $view);
$di->set('Logger', $log);

$router = new Router($di);
$response = $router->route(new Request());
echo $response;

?>
