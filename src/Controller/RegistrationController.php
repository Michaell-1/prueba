<?php

namespace App\Controller;

use App\Entity\Persona;
use App\Entity\Usuario;
use App\Entity\Empresa;

use App\Entity\UsuarioEmpresa;
use App\Form\RegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/empregister', name: 'app_empregister')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $persona = new Persona();
        $empresa = new Empresa();
        $user = new Usuario();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $empresa->setNombre($form->get('nombre')->getData());
            $empresa->setRuc($form->get('ruc')->getData());
            $empresa->setDueño($form->get('dueno')->getData());
            $empresa->setContacto($form->get('contacto')->getData());
            $empresa->setUbicacion($form->get('ubicacion')->getData());
            $entityManager->persist($empresa);

            
            /** @var string $plainPassword */
            $plainPassword = $form->get('plainPassword')->getData();

            // encode the plain password
            $user->setPassword($userPasswordHasher->hashPassword($user, $plainPassword));
            // establecer el rol del usuario
            $user->setRoles(['ROLE_USER']);

            $userEmpresa = new UsuarioEmpresa();
            $userEmpresa->setEmpresa($empresa);
            $userEmpresa->setUsuario($user);
            $entityManager->persist($userEmpresa);

            $user->setEmail($form->get('email')->getData());
            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email

            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form,
        ]);
    }
}
