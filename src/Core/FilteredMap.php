<?php

namespace MyBlog\Core;

class FilteredMap {
	private $map;

	public function __construct(array $baseMap) {
		$this->map = $baseMap;
	}

	public function has(string $name): bool {
		return isset($this->map[$name]);
	}

	// nested array: has
	public function hasNested(string $name1, string $name2): bool {
		return isset($this->map[$name1][$name2]);
	}

	public function get(string $name) {
		return $this->map[$name] ?? null; // Null Coalescing Operator
	}

    // nested array: get
	public function getNested(string $name1, string $name2) {
		return $this->map[$name1][$name2] ?? null;
	}

	public function getInt(string $name) {
		return (int) $this->get($name);
	}

    // nested array: get integer
	public function getIntNested(string $name1, string $name2) {
		return (int) $this->getNested($name1, $name2);
	}

	public function getNumber(string $name) {
		return (float) $this->get($name);
	}

	public function getString(string $name, bool $filter = true) {
		$value = (string) $this->get($name);
		return $filter ? addslashes($value) : $value;
	}

    // nested array: get string
	public function getStringNested(
		string $name1,
		string $name2,
		bool $filter = true
	) {
		$value = (string) $this->getNested($name1, $name2);
		return $filter ? addslashes($value) : $value;
	}
}

?>
