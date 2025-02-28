<?php

namespace App\Controller;

use App\Entity\Usuario;
use App\Entity\Persona;

use App\Form\RegistrationFormType;
use App\Form\UsRegistrationFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class UsRegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $persona = new Persona();
        $user = new Usuario();
        $form = $this->createForm(UsRegistrationFormType::class, $persona);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $persona->setNombres($form->get('nombres')->getData());
            $persona->setApellidos($form->get('apellidos')->getData());
            $persona->setEdad($form->get('edad')->getData());
            $persona->setGenero($form->get('genero')->getData());
            $persona->setDireccion($form->get('direccion')->getData());
            $persona->setCedula($form->get('cedula')->getData());
            $persona->setCelular($form->get('celular')->getData());
            $entityManager->persist($persona);

            /** @var string $plainPassword */
            $plainPassword = $form->get('plainPassword')->getData();

            // encode the plain password
            $user->setPassword($userPasswordHasher->hashPassword($user, $plainPassword));
            $user->setPersona($persona);
            $user->setEmail($form->get('email')->getData());
            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email

            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/usregister.html.twig', [
            'registrationForm' => $form,
        ]);
    }
}
