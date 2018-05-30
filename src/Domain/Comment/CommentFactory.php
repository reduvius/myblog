<?php

namespace MyBlog\Domain\Comment;

use MyBlog\Domain\Comment;

class CommentFactory {
	public static function factory(
	    string $name,
	    string $content,
	    int $postId
	): Post {
		$comment = new Comment();
		$comment->setName($name);
		$comment->setContent($content);
		$comment->setPostId($postId);

		return $comment;
	}
}

?>
