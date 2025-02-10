<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class PostulacionController extends AbstractController{
    #[Route('/postulacion', name: 'app_postulacion')]
    public function index(): Response
    {
        return $this->render('postulacion/index.html.twig', [
            'controller_name' => 'PostulacionController',
        ]);
    }
}
