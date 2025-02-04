<?php

namespace App\Entity;

use App\Repository\EmpresaRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EmpresaRepository::class)]
class Empresa
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $nombre = null;

    #[ORM\Column]
    private ?int $ruc = null;

    #[ORM\Column(length: 200)]
    private ?string $dueño = null;

    #[ORM\Column]
    private ?int $contacto = null;

    #[ORM\Column(length: 255)]
    private ?string $ubicacion = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): static
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getRuc(): ?int
    {
        return $this->ruc;
    }

    public function setRuc(int $ruc): static
    {
        $this->ruc = $ruc;

        return $this;
    }

    public function getDueño(): ?string
    {
        return $this->dueño;
    }

    public function setDueño(string $dueño): static
    {
        $this->dueño = $dueño;

        return $this;
    }

    public function getContacto(): ?int
    {
        return $this->contacto;
    }

    public function setContacto(int $contacto): static
    {
        $this->contacto = $contacto;

        return $this;
    }

    public function getUbicacion(): ?string
    {
        return $this->ubicacion;
    }

    public function setUbicacion(string $ubicacion): static
    {
        $this->ubicacion = $ubicacion;

        return $this;
    }
}
