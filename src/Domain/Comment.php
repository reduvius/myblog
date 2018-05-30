<?php

namespace MyBlog\Domain;

class Comment {
	private $id;
	private $date;
	private $name;
	private $content;
	private $post_id;

	public function getId(): int {
		return $this->id;
	}

	public function getDate(): string {
		return $this->date;
	}

	public function getName(): string {
		return $this->name;
	}

	public function getContent(): string {
		return $this->content;
	}

	public function getPostId(): int {
		return $this->post_id;
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

	public function setContent(string $content) {
		$this->content = $content;
	}

	public function setPostId(int $postId) {
		$this->post_id = $postId;
	}
}

?>
