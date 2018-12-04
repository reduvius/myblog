<?php

namespace MyBlog\Domain\Image;

use MyBlog\Domain\Image;

class ImageFactory {
	public static function factory(
	    string $name,
	    int $userId
	): Image {
		$image = new Image();
		$image->setName($name);
		$image->setUserId($userId);

		return $image;
	}
}

?>
