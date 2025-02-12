<?php

// src/Entity/JobOffer.php
namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class JobOffer
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $title = null;

    #[ORM\Column(length: 255)]
    private ?string $contractType = null;

    #[ORM\Column(length: 255)]
    private ?string $canton = null;

    #[ORM\Column(length: 255)]
    private ?string $parish = null;

    // Getters y Setters...
}