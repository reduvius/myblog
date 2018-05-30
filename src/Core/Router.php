<?php

namespace MyBlog\Core;

use MyBlog\Utils\DependencyInjector;
use MyBlog\Controllers\ErrorController;
use MyBlog\Controllers\UserController;

class Router {
	private $routeMap;
	private static $regexPatters = [
	    'number' => '\d+',
	    'string' => '\w'
	];
	private $di;

	public function __construct(DependencyInjector $di) {
		$this->di = $di;
		$json = file_get_contents(__DIR__ . '/config/routes.json');
		$this->routeMap = json_decode($json, true);
	}

	public function route(Request $request): string {
		$path = $request->getPath();

		foreach ($this->routeMap as $route => $info) {
			$regexRoute = $this->getRegexRoute($route, $info);
			if (preg_match("@^/$regexRoute$@", $path)) {
				return $this->executeController(
				    $route, $path, $info, $request
				);
			}
		}

		$errorController = new ErrorController($this->di, $request);
		return $errorController->notFound();
	}

	private function getRegexRoute(
	    string $route,
	    array $info
	): string {
		if (isset($info['params'])) {
			foreach ($info['params'] as $name => $type) {
				$route = str_replace(
				    ':' . $name, self::$regexPatters[$type], $route
				);
			}
		}

		return $route;
	}

	private function extractParams(
	    string $route,
	    string $path
	): array {
		$params = [];

		$pathParts = explode('/', $path);
		$routeParts = explode('/', $route);

		foreach ($routeParts as $key => $routePart) {
			if (strpos($routePart, ':') === 0) {
				$name = substr($routePart, 1);
				$params[$name] = $pathParts[$key+1]; // zasto [+1] ???
			}
		}

		return $params;
	}

	private function executeController(
	    string $route,
	    string $path,
	    array $info,
	    Request $request
	): string {
		$controllerName = '\MyBlog\Controllers\\'
		    . $info['controller'] . 'Controller';
		$controller = new $controllerName($this->di, $request);

		if (isset($info['login']) && $info['login']) {
			if ($request->getCookies()->has('user')) {
				$userId = $request->getCookies()->get('user');
				$controller->setUserId($userId);
			} else {
				$userController = new UserController(
				    $this->di,
				    $request
				);
				return $userController->login();
			}
		}

		$params = $this->extractParams($route, $path);
		return call_user_func_array(
		    [$controller, $info['method']], $params
		);
	}
}

?>
