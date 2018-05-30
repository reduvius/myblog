<?php

namespace MyBlog\Domain\User;

use MyBlog\Domain\User;

class UserFactory {
	public static function factory(
	    string $name,
	    string $email,
	    string $password
	): User {
		$user = new User();
		$user->setName($name);
		$user->setEmail($email);
		$user->setPassword($password);
		
		return $user;
	}
}

?>
