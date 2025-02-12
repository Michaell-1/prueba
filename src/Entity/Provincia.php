<?php

namespace App\Entity;

use App\Repository\ProvinciaRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProvinciaRepository::class)]
class Provincia
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $canton = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCanton(): ?string
    {
        return $this->canton;
    }

    public function setCanton(string $canton): static
    {
        $this->canton = $canton;

        return $this;
    }
}
