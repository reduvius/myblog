<?php

namespace MyBlog\Controllers;

use MyBlog\Models\ImageModel;
use MyBlog\Domain\Image\ImageFactory;

class ImageController extends AbstractController {
    // Get all images
    public function getImages(): string {
        $imageModel = new ImageModel($this->db);
        $images = $imageModel->getImages();

        $properties = [
            'images' => $images,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
		];
		return $this->render('gallery.twig', $properties);
	}

    // Get images by user
    public function getImagesByUser(): string {
        $imageModel = new ImageModel($this->db);
        $images = $imageModel->getImagesByUser($this->userId);
        $numberOfImages = $imageModel->countImagesByUser($this->userId);

        $properties = [
            'images' => $images,
            'numberOfImages' => $numberOfImages,
			'isAuth' => $this->isAuthenticated(),
			'uId' => $this->returnUserCookie(),
		];
		return $this->render('my-gallery.twig', $properties);
	}

    // Get form for image uploading
	public function newImageGetForm(): string {
		return $this->render('new-image.twig', [
			'isAuth' => $this->isAuthenticated()
		]);
	}

    // Upload new image
    public function newImage(): string {
        // Original name of the file from the user's computer
        $originalName = basename($_FILES["fileToUpload"]["name"]);
        // Image file type
        $imgFileType = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));
        // Generate random name of the image for targetFile
        $newName = time() . mt_rand(1000, 9999);
        // Specifies the directory where the file is going to be placed
        $targetDir = "/vagrant/application/myblog/src/storage/images/uploads/";
        // Specifies the path of the file to be uploaded
        $targetFile = $targetDir . $newName . "." . $imgFileType;
        // Upload: 0 or 1
        $uploadOk = 1;


        // Check if image file is an actual image or a fake image
        if (isset($_POST["submit"])) {
            $tmpName = $_FILES["fileToUpload"]["tmp_name"];

            if ($tmpName) {
                $uploadOk = 1;
            } else {
                $params = [
    				'errorMessage' => 'No file selected.',
    		        'isAuth' => $this->isAuthenticated()
    			];
    			return $this->render('new-image.twig', $params);

                $uploadOk = 0;
            }

            $check = getimagesize($tmpName);

            if ($check) {
                $uploadOk = 1;
            } else {
                $params = [
    				'errorMessage' => 'File is not an image.',
    		        'isAuth' => $this->isAuthenticated()
    			];
    			return $this->render('new-image.twig', $params);

                $uploadOk = 0;
            }
        }

        // Check if file already exists
        if (file_exists($targetFile)) {
            $params = [
                'errorMessage' => 'Sorry, file already exists.',
                'isAuth' => $this->isAuthenticated()
            ];
			return $this->render('new-image.twig', $params);

            $uploadOk = 0;
        }

        // Check file size
        if ($_FILES["fileToUpload"]["size"] > 2000000) {
            $params = [
                'errorMessage' => 'Sorry, your file is too large.',
                'isAuth' => $this->isAuthenticated()
            ];
			return $this->render('new-image.twig', $params);

            $uploadOk = 0;
        }

        // Allow certain file formats
        if ($imgFileType != "jpg" && $imgFileType != "png"
            && $imgFileType != "jpeg" && $imgFileType != "gif" ) {
            $params = [
                'errorMessage' =>
                    'Sorry, only JPG, JPEG, PNG & GIF files are allowed.',
                'isAuth' => $this->isAuthenticated()
            ];
    		return $this->render('new-image.twig', $params);

            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        // If everything is ok, try to upload file
        if (!$uploadOk) {
            $params = [
                'errorMessage' => 'Sorry, your file was not uploaded.',
                'isAuth' => $this->isAuthenticated()
            ];
            return $this->render('new-image.twig', $params);
        }

        $newImage = ImageFactory::factory($newName . "." . $imgFileType,
            $this->userId);

		$imageModel = new ImageModel($this->db);

        try {
            move_uploaded_file($_FILES["fileToUpload"]["tmp_name"],
                $targetFile);
            $imageModel->newImage($newImage);
        } catch (\Exception $e) {
            $this->log->warn('Error: failed to create new post');
            $params = [
                'errorMessage' =>
                    'Sorry, there was an error uploading your file.',
                'isAuth' => $this->isAuthenticated()
            ];
            return $this->render('new-image.twig', $params);
        }

        $params = [
            'successMessage' => "The image has been successfully uploaded.",
            'isAuth' => $this->isAuthenticated()
        ];
        return $this->render('new-image.twig', $params);
	}

    // Delete an image from the database and uploads folder
    public function deleteImage(int $id): string {
        $imageModel = new ImageModel($this->db);
        $imageModel->deleteImage($id);

        return $this->getImagesByUser();
    }
}
