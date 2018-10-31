<?php

namespace MyBlog\Models;

use MyBlog\Domain\Post;
use PDO;

class PostModel extends AbstractModel {
	const CLASSNAME = '\MyBlog\Domain\Post';

    // Get post by id
	public function getPostById(int $id): Post {
		$query = <<<SQL
SELECT p.id, p.date, p.title, p.content, p.user_id, u.name
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE p.id = :id
SQL;
		$sth = $this->db->prepare($query);
		$sth->execute(['id' => $id]);

		$post = $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);

		if (empty($post)) {
			throw new \Exception('Post not found.');
		}

		return $post[0];
	}

    // Get posts by user id
	public function getPostsByUserId(
		int $userId,
		int $page,
		int $pageLength
	): array {
        $start = $pageLength * ($page - 1);

		$query = <<<SQL
SELECT p.id, p.date, p.title, p.content, p.user_id, u.name
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE p.user_id = :userId
ORDER BY p.date DESC
LIMIT :page, :length
SQL;
		$sth = $this->db->prepare($query);
		$sth->bindParam('userId', $userId, PDO::PARAM_INT);
		$sth->bindParam('page', $start, PDO::PARAM_INT);
		$sth->bindParam('length', $pageLength, PDO::PARAM_INT);
		$sth->execute();

		return $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);
	}

    // Count number of posts from certain user
	public function countPostsByUser(int $userId): int {
		$query = <<<SQL
SELECT COUNT(*)
FROM posts
WHERE user_id = :userId
SQL;
        $sth = $this->db->prepare($query);
	    $sth->execute(['userId' => $userId]);
		$countPosts = $sth->fetch();

		return $countPosts[0];
	}

    // Get all posts
	public function getAllPosts(int $page, int $pageLength): array {
		$start = $pageLength * ($page - 1);

		$query = <<<SQL
SELECT p.id, p.date, p.title, p.content, p.user_id, u.name
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
ORDER BY p.date DESC
LIMIT :page, :length
SQL;
		$sth = $this->db->prepare($query);
		$sth->bindParam('page', $start, PDO::PARAM_INT);
		$sth->bindParam('length', $pageLength, PDO::PARAM_INT);
		$sth->execute();

		return $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);
	}

    // Count all posts
	public function countPosts(): int {
		$countPosts = $this->db->query('SELECT COUNT(*) FROM posts');
		$countPosts = $countPosts->fetch();

		return $countPosts[0];
	}

    // Search posts by title
	public function search(string $title): array {
		$query = <<<SQL
SELECT p.id, p.date, p.title, p.content, p.user_id, u.name
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE title LIKE :title
ORDER BY p.date DESC
SQL;
		$sth = $this->db->prepare($query);
		$sth->bindValue('title', "%$title%");
		$sth->execute();

		$posts = $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);

		if (empty($posts)) {
			throw new \Exception('Nothing found.');
		}

		return $posts;
	}

    // Create new post
	public function createNewPost(Post $post) {
		$query = <<<SQL
INSERT INTO posts (date, title, content, user_id)
VALUES (NOW(), :title, :content, :userId)
SQL;
        $sth = $this->db->prepare($query);
        $sth->bindValue('title', $post->getTitle());
        $sth->bindValue('content', $post->getContent());
        $sth->bindValue('userId', $post->getUserId());
        if (!$sth->execute()) {
			throw new \Exception($sth->errorInfo()[2]);
		}
	}

    // Delete post
	public function deletePost(int $id) {
        $query = 'DELETE FROM posts WHERE id = :id';
		$sth = $this->db->prepare($query);
		if (!$sth->execute(['id' => $id])) {
			throw new \Exception($sth->errorInfo()[2]);
		}
	}
}

?>
