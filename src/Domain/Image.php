<?php

namespace MyBlog\Domain;

class Image {
	private $id;
	private $date;
	private $name;
	private $user_id;

	public function getId(): int {
		return $this->id;
	}

	public function getDate(): string {
		return $this->date;
	}

	public function getName(): string {
		return $this->name;
	}

	public function getUserId(): int {
		return $this->user_id;
	}

	public function setId(int $id) {
		$this->id = $id;
	}

	public function setDate(string $date) {
		$this->date = $date;
	}

	public function setName(string $name) {
		$this->name = $name;
	}

	public function setUserId(int $userId) {
		$this->user_id = $userId;
	}
}

?>
