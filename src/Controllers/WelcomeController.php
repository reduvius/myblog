<?php

namespace MyBlog\Controllers;

use MyBlog\Models\UserModel;

class WelcomeController extends AbstractController {
	// Get welcome page
	public function getWelcomePage(): string {
		if ($this->returnUserCookie()) {
		    $userModel = new UserModel($this->db);
            $user = $userModel->getUserById($this->returnUserCookie());

		    $properties = [
			    'user' => $user,
				'uId' => $this->returnUserCookie(),
			    'isAuth' => $this->isAuthenticated()
		    ];
		} else {
			$properties = [
			    'isAuth' => $this->isAuthenticated()
		    ];
		}
		return $this->render('welcome.twig', $properties);
	}
}

?>
