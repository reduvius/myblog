<?php

namespace MyBlog\Core;

class FilteredMap {
	private $map;

	public function __construct(array $baseMap) {
		$this->map = $baseMap;
	}

	public function has(string $name1, string $name2 = null): bool {
		if (!$name2) {
		    return isset($this->map[$name1]);
		} else {
			return isset($this->map[$name1][$name2]);
		}
	}

	public function get(string $name1, string $name2 = null) {
		if (!$name2) {
		    return $this->map[$name1] ?? null; // Null coalescing operator
		} else {
			return $this->map[$name1][$name2] ?? null;
		}
	}

    // Get integer
	public function getInt(string $name1, string $name2 = null) {
		if (!$name2) {
		    return (int) $this->get($name1);
		} else {
			return (int) $this->get($name1, $name2);
		}
	}

    // Get floating number
	public function getNumber(string $name1, string $name2 = null) {
		if (!$name2) {
		    return (float) $this->get($name1);
		} else {
			return (float) $this->get($name1, $name2);
		}
	}

    // Get string with or without slashes
	public function getString(
		string $name1,
		string $name2 = null,
		bool $filter = true
	) {
		if (!$name2) {
		    $value = (string) $this->get($name1);
		} else {
			$value = (string) $this->get($name1, $name2);
		}
		return $filter ? addslashes($value) : $value;
	}
}

?>
