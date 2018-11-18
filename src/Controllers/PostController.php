<?php

namespace MyBlog\Controllers;

use MyBlog\Models\PostModel;
use MyBlog\Domain\Post\PostFactory;

class PostController extends AbstractController {
	const PAGE_LENGTH = 10;

    // Get post by id
	public function getPost(int $id): string {
		$postModel = new PostModel($this->db);

		$post = $postModel->getPostById($id);

		$properties = [
			'post' => $post,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
		];
		return $this->render('post.twig', $properties);
	}

    // Get all posts with page
	public function getAllPostsWithPage($page): string {
		$page = (int) $page;
		$postModel = new PostModel($this->db);

		$posts = $postModel->getAllPosts($page, self::PAGE_LENGTH);

		$numberOfPosts = $postModel->countPosts();
		$numberOfPages = ceil($numberOfPosts / self::PAGE_LENGTH);
		$pagesArray = [];

		for ($x = 1; $x <= $numberOfPages; $x++) {
		  $pagesArray[$x] = $x;
		}

        $properties = [
			'posts' => $posts,
			'pagesArray' => $pagesArray,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
			'currentPage' => $page,
			'lastPage' => end($pagesArray)
		];
		return $this->render('posts.twig', $properties);
	}

    // Get all posts with page 1
	public function getAllPosts(): string {
		return $this->getAllPostsWithPage(1);
	}

    // Get all posts by user with page
	public function getPostsByUserWithPage($page): string {
		$page = (int) $page;
	    $postModel = new PostModel($this->db);

		$posts = $postModel->getPostsByUserId(
			$this->userId,
			$page,
			self::PAGE_LENGTH
		);

		$numberOfPosts = $postModel->countPostsByUser($this->userId);
		$numberOfPages = ceil($numberOfPosts / self::PAGE_LENGTH);
		$pagesArray = [];

		for ($x = 1; $x <= $numberOfPages; $x++) {
		  $pagesArray[$x] = $x;
		}

		$properties = [
			'posts' => $posts,
			'pagesArray' => $pagesArray,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
			'currentPage' => $page,
			'lastPage' => end($pagesArray)
		];
		return $this->render('my-posts.twig', $properties);
	}

    // Get all posts by user with page 1
	public function getPostsByUser(): string {
		return $this->getPostsByUserWithPage(1);
	}

    // Search by post title
	public function search(): string {
		$title = $this->request->getParams()->getString('title');

		$postModel = new PostModel($this->db);

		try {
			$posts = $postModel->search($title);
		} catch (\Exception $e) {
			$params = [
				'errorMessage' => $e->getMessage(),
				'isAuth' => $this->isAuthenticated()
			];
			return $this->render('error.twig', $params);
		}

		$properties = [
			'posts' => $posts,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
			'currentPage' => 1,
			'lastPage' => true
		];
		return $this->render('posts.twig', $properties);
	}

    // Get form for creating new posts
	public function newPostGetForm(): string {
		return $this->render('new-post.twig', [
			'isAuth' => $this->isAuthenticated()
		]);
	}

    // Create new post
	public function newPost(): string {
		if (!$this->request->isPost()) {
			return $this->render('new-post.twig', [
				'isAuth' => $this->isAuthenticated()
			]);
		}

		$params = $this->request->getParams();

		if (!$params->has('title')) {
			$params = [
				'errorMessage' => 'Title not entered.',
		        'isAuth' => $this->isAuthenticated()
			];
			return $this->render('new-post.twig', $params);
		}

        $title = $params->getString('title');

		if (!$params->has('content')) {
			$params = [
				'errorMessage' => 'Text not entered.',
		        'isAuth' => $this->isAuthenticated()
			];;
			return $this->render('new-post.twig', $params);
		}

        $content = $params->getString('content');

		$newPost = PostFactory::factory($title, $content, $this->userId);

		$postModel = new PostModel($this->db);

		try {
			$postModel->createNewPost($newPost);
		} catch (\Exception $e) {
			$this->log->warn('Error: failed to create new post');
			$params = [
				'errorMessage' => 'Error: failed to create new post.',
		        'isAuth' => $this->isAuthenticated()
			];
			return $this->render('new-post.twig', $params);
		}

		return $this->getPostsByUser();
	}

    // Delete post
	public function deletePost(int $id): string {
		$postModel = new PostModel($this->db);
		$postModel->deletePost($id);

		return $this->getPostsByUser();
	}

	// Get form for post editing
	public function editPostGetForm(int $id): string {
		$postModel = new PostModel($this->db);

		$post = $postModel->getPostById($id);

		$properties = [
			'post' => $post,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
		];
		return $this->render('edit-post.twig', $properties);
	}

    // Edit post
	public function editPost(int $id): string {
		if (!$this->request->isPost()) {
			$params = [
				'errorMessage' => 'Something went wrong. Please try again.',
		        'isAuth' => $this->isAuthenticated()
			];;
			return $this->render('error.twig', $params);
		}

		$params = $this->request->getParams();

		if (!$params->has('title')) {
			$params = [
				'errorMessage' => 'Title not entered.',
		        'isAuth' => $this->isAuthenticated()
			];
			return $this->render('error.twig', $params);
		}

        $title = $params->getString('title');

		if (!$params->has('content')) {
			$params = [
				'errorMessage' => 'Text not entered.',
		        'isAuth' => $this->isAuthenticated()
			];;
			return $this->render('error.twig', $params);
		}

        $content = $params->getString('content');

		$postModel = new PostModel($this->db);

		try {
			$postModel->editPost($id, $title, $content);
		} catch (\Exception $e) {
			$this->log->warn('Error: failed to edit post');
			$params = [
				'errorMessage' => 'Error: Failed to edit post.',
		        'isAuth' => $this->isAuthenticated()
			];
			return $this->render('error.twig', $params);
		}

		return $this->getPost($id);
	}
}

?>
