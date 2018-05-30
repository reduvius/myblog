<?php

namespace MyBlog\Domain;

class User {
	private $id;
	private $name;
	private $email;
	private $password;
	
	public function getId(): int {
		return $this->id;
	}
	
	public function getName(): string {
		return $this->name;
	}
	
	public function getEmail(): string {
		return $this->email;
	}
	
	public function getPassword(): string {
		return $this->password;
	}
	
	public function setId(int $id) {
		$this->id = $id;
	}
	
	public function setName(string $name) {
		$this->name = $name;
	}
	
	public function setEmail(string $email) {
		$this->email = $email;
	}
	
	public function setPassword(string $password) {
		$this->password = $password;
	}
}

?>
