<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class EmpperfilController extends AbstractController
{
    #[Route('/empperfil', name: 'app_empperfil')]
    public function index(): Response
    {
        return $this->render('empperfil/index.html.twig', [
            'controller_name' => 'EmpperfilController',
        ]);
    }
}
