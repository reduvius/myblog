<?php

namespace MyBlog\Controllers;

class WelcomeController extends AbstractController {
	// Get welcome page
	public function getWelcomePage(): string {
		$properties = [
			'isAuth' => $this->isAuthenticated()
		];
		return $this->render('welcome.twig', $properties);
	}
}

?>
