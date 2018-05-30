<?php

namespace MyBlog\Utils;

class DependencyInjector {
	private $dependencies = [];
	
	public function set(string $name, $object) {
		$this->dependencies[$name] = $object;
	}
	
	public function get(string $name) {
		if (!isset($this->dependencies[$name])) {
		    throw new \Exception(
		        $name . ' dependency not found.'
		    );	
		}
		return $this->dependencies[$name];
	}
}

// ubaci not found exception umesto ovog obicnog

?>
