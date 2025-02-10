<?php

// src/Controller/JobOfferController.php
namespace App\Controller;

use App\Entity\JobOffer;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class JobOfferController extends AbstractController
{
    #[Route('/job-offers', name: 'job_offers', methods: ['GET'])]
    public function index(EntityManagerInterface $em): JsonResponse
    {
        $offers = $em->getRepository(JobOffer::class)->findAll();
        return $this->json($offers);
    }

    #[Route('/job-offers/search', name: 'search_job_offers', methods: ['GET'])]
    public function search(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $title = $request->query->get('title');
        $contractType = $request->query->get('contractType');

        $query = $em->createQuery(
            "SELECT j FROM App\Entity\JobOffer j 
            WHERE j.title LIKE :title AND j.contractType LIKE :contractType"
        )->setParameters([
            'title' => "%$title%",
            'contractType' => "%$contractType%"
        ]);

        return $this->json($query->getResult());
    }
}
