<?php

namespace MyBlog\Models;

use MyBlog\Domain\User;
use PDO;

class UserModel extends AbstractModel {
	const CLASSNAME = '\MyBlog\Domain\User';

	public function getUserById(int $id): User {
		$query = 'SELECT * FROM users WHERE id = :id';
		$sth = $this->db->prepare($query);
		$sth->execute(['id' => $id]);

		$user = $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);

		if (empty($user)) {
			throw new \Exception('User not found.');
		}

		return $user[0];
	}

	public function getUserByEmlAndPswd(
		string $email,
		string $password
    ): User {
		$query = <<<SQL
SELECT *
FROM users
WHERE email = :email AND password = :password
SQL;
		$sth = $this->db->prepare($query);
		$sth->bindValue('email', $email);
		$sth->bindValue('password', $password);
		$sth->execute();

		$user = $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);

		if (empty($user)) {
			throw new \Exception('User not found.');
		}

		return $user[0];
	}

	public function createNewUser(User $user) {
		$query = <<<SQL
INSERT INTO users (name, email, password)
VALUES (:name, :email, :password)
SQL;
        $sth = $this->db->prepare($query);
        $sth->bindValue('name', $user->getName());
        $sth->bindValue('email', $user->getEmail());
        $sth->bindValue('password', $user->getPassword());
        if (!$sth->execute()) {
			throw new \Exception($sth->errorInfo()[2]);
		}
	}
}

?>
