<?php

namespace MyBlog\Controllers;

class ErrorController extends AbstractController {
	public function notFound(): string {
		$properties = [
			'errorMessage' => 'Page not found!',
			'isAuth' => $this->isAuthenticated()
		];
		return $this->render('error.twig', $properties);
	}
}

?>
