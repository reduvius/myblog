<?php

namespace MyBlog\Domain;

class Post {
	private $id;
	private $date;
	private $title;
	private $content;
	private $user_id;
	
	public function getId(): int {
		return $this->id;
	}
	
	public function getDate(): string {
		return $this->date;
	}
	
	public function getTitle(): string {
		return $this->title;
	}
	
	public function getContent(): string {
		return $this->content;
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
	
	public function setTitle(string $title) {
		$this->title = $title;
	}
	
	public function setContent(string $content) {
		$this->content = $content;
	}
	
	public function setUserId(int $userId) {
		$this->user_id = $userId;
	}
}

?>
