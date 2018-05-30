<?php

namespace MyBlog\Controllers;

use MyBlog\Models\UserModel;
use MyBlog\Domain\User\UserFactory;
use MyBlog\Models\PostModel;

class UserController extends AbstractController {
    public function getRegisterForm(): string {
        return $this->render('register.twig', []);
	}

	public function register(): string {
        if (!$this->request->isPost()) {
			return $this->render('register.twig', []);
		}

        $params = $this->request->getParams();

        if (!$params->has('name')) {
			$params = ['errorMessage' => 'Name not provided.'];
			return $this->render('register.twig', $params);
		}

        $name = $params->getString('name');

        if (!$params->has('email')) {
			$params = ['errorMessage' => 'No email provided.'];
			return $this->render('register.twig', $params);
		}

        $email = $params->getString('email');

        if (!$params->has('password')) {
			$params = ['errorMessage' => 'No password provided.'];
			return $this->render('register.twig', $params);
		}

        $password = $params->getString('password');

        $newUser = UserFactory::factory($name, $email, $password);

        $userModel = new UserModel($this->db);

        try {
            $userModel->createNewUser($newUser);
        } catch (\Exception $e) {
			$this->log->warn('Error: user not created');
			$params = ['errorMessage' => 'Error: User not created.'];
			return $this->render('register.twig', $params);
		}

        return $this->getLoginForm();
    }

	public function getLoginForm(): string {
        return $this->render('login.twig', []);
	}

	public function login(): string {
		if (!$this->request->isPost()) {
			return $this->render('login.twig', []);
		}

		$params = $this->request->getParams();

		if (!$params->has('email')) {
			$params = ['errorMessage' => 'No email provided.'];
			return $this->render('login.twig', $params);
		}

        $email = $params->getString('email');

        if (!$params->has('password')) {
			$params = ['errorMessage' => 'No password provided.'];
			return $this->render('login.twig', $params);
		}

		$password = $params->getString('password');

        $userModel = new UserModel($this->db);

		try {
			$user = $userModel->getUserByEmlAndPswd($email, $password);
		} catch (\Exception $e) {
			$this->log->warn('User not found: ' . $email . ', ' . $password);
			$params = ['errorMessage' => 'User not found.'];
			return $this->render('login.twig', $params);
		}

		setcookie('user', $user->getId());

        header('Location: /my-posts');

        $newController = new PostController($this->di, $this->request);
		return $newController->getPostsByUser();
    }

    public function logout(): string {
        setcookie('user', "", time()-3600);

        header('Location: /');

        $newController = new PostController($this->di, $this->request);
		return $newController->getAllPosts();
    }

    public function getProfile(): string {
        $userModel = new UserModel($this->db);
        $user = $userModel->getUserById($this->userId);

        $postModel = new PostModel($this->db);
        $numberOfPosts = $postModel->countPostsByUser($this->userId);

        $properties = [
            'user' => $user,
            'isAuth' => $this->isAuthenticated(),
            'numberOfPosts' => $numberOfPosts
        ];
        return $this->render('profile.twig', $properties);
    }
}

?>
