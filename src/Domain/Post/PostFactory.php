<?php

namespace MyBlog\Domain\Post;

use MyBlog\Domain\Post;

class PostFactory {
	public static function factory(
	    string $title,
	    string $content,
	    int $userId
	): Post {
		$post = new Post();
		$post->setTitle($title);
		$post->setContent($content);
		$post->setUserId($userId);
		
		return $post;
	}
}

?>
