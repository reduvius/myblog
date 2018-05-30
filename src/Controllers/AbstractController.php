<?php

namespace MyBlog\Controllers;

use MyBlog\Utils\DependencyInjector;
use MyBlog\Core\Request;

abstract class AbstractController {
	protected $request;
	protected $di;
	protected $db;
    protected $log;
    protected $view;
	protected $config;
	protected $userId;

	public function __construct(
	    DependencyInjector $di,
	    Request $request
	) {
		$this->request = $request;
		$this->di = $di;

		$this->db = $di->get('PDO');
		$this->log = $di->get('Logger');
		$this->view = $di->get('Twig_Environment');
		$this->config = $di->get('Config');
	}

	public function setUserId(int $userId) {
		$this->userId = $userId;
	}

	protected function render(string $template, array $params): string {
		return $this->view->loadTemplate($template)->render($params);
	}

	public function isAuthenticated(): bool {
        return $this->request->getCookies()->getInt('user');
    }

	public function returnUserCookie(): int {
		return $this->request->getCookies()->getInt('user');
	}
}

?>
