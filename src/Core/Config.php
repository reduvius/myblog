<?php

namespace MyBlog\Core;

class Config {
	private $data;

	// Contruct config object from /config/app.json
	public function __construct() {
		$json = file_get_contents(__DIR__ . '/config/app.json');
		$this->data = json_decode($json, true);
	}

	// Get certain config key
	public function get($key) {
		if (!isset($this->data[$key])) {
			throw new \Exception("Key $key not found");
		}
		return $this->data[$key];
	}
}

?>
