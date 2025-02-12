<?php

namespace App\Controller;

use App\Entity\Empresa;
use App\Entity\UsuarioEmpresa;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\User\UserInterface;

class EmpperfilController extends AbstractController


{
    #[Route('/empperfil', name: 'app_empperfil')]
    public function index(EntityManagerInterface $em, UserInterface $user): Response
    {
        $usuarioEmpresas = $em->getRepository(UsuarioEmpresa::class)->findBy(['usuario' => $user->getId()]);  
        $empresas = [];
        foreach ($usuarioEmpresas as $usuarioEmpresa) {
            $empresas[] = $usuarioEmpresa->getEmpresa();
        }
        
        return $this->render('empperfil/index.html.twig', [
            'controller_name' => 'EmpperfilController',
            'empresas' => $empresas,
        ]);
    }
}

