<?php

namespace MyBlog\Models;

use MyBlog\Domain\Image;
use PDO;

class ImageModel extends AbstractModel {
    const CLASSNAME = '\MyBlog\Domain\Image';

    // Get all images
	public function getImages(): array {
		$query = <<<SQL
SELECT i.date, i.name, i.user_id AS uid, u.name AS uname
FROM images i
LEFT JOIN users u ON i.user_id = u.id
ORDER BY i.date DESC
SQL;
		$sth = $this->db->prepare($query);
		$sth->execute();

		return $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);
	}

    // Get all images uploaded by the certain user
	public function getImagesByUser(int $userId): array {
		$query = <<<SQL
SELECT i.id, i.date, i.name, i.user_id AS uid, u.name AS uname
FROM images i
LEFT JOIN users u ON i.user_id = u.id
WHERE i.user_id = :userId
ORDER BY i.date DESC
SQL;
		$sth = $this->db->prepare($query);
        $sth->bindParam('userId', $userId, PDO::PARAM_INT);
		$sth->execute();

		return $sth->fetchAll(PDO::FETCH_CLASS, self::CLASSNAME);
	}

    // Count the number of images uploaded by the certain user
	public function countImagesByUser(int $userId): int {
		$query = <<<SQL
SELECT COUNT(*)
FROM images
WHERE user_id = :userId
SQL;
        $sth = $this->db->prepare($query);
	    $sth->execute(['userId' => $userId]);
		$countImages = $sth->fetch();

		return $countImages[0];
	}

    // Insert new image name and user id into the database
	public function newImage(Image $image) {
		$query = <<<SQL
INSERT INTO images (date, name, user_id)
VALUES (NOW(), :name, :userId)
SQL;
        $sth = $this->db->prepare($query);
        $sth->bindValue('name', $image->getName());
        $sth->bindValue('userId', $image->getUserId());
        if (!$sth->execute()) {
			throw new \Exception($sth->errorInfo()[2]);
		}
	}

    // Delete an image from the database
	public function deleteImage(int $id) {
        $query = 'DELETE FROM images WHERE id = :id';
		$sth = $this->db->prepare($query);
		if (!$sth->execute(['id' => $id])) {
			throw new \Exception($sth->errorInfo()[2]);
		}
	}
}

?>
