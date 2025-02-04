<?php

namespace App\Entity;

use App\Repository\EmpresaRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
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

    /**
     * @var Collection<int, UsuarioEmpresa>
     */
    #[ORM\OneToMany(targetEntity: UsuarioEmpresa::class, mappedBy: 'empresa')]
    private Collection $usuarioEmpresas;

    public function __construct()
    {
        $this->usuarioEmpresas = new ArrayCollection();
    }

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

    /**
     * @return Collection<int, UsuarioEmpresa>
     */
    public function getUsuarioEmpresas(): Collection
    {
        return $this->usuarioEmpresas;
    }

    public function addUsuarioEmpresa(UsuarioEmpresa $usuarioEmpresa): static
    {
        if (!$this->usuarioEmpresas->contains($usuarioEmpresa)) {
            $this->usuarioEmpresas->add($usuarioEmpresa);
            $usuarioEmpresa->setEmpresa($this);
        }

        return $this;
    }

    public function removeUsuarioEmpresa(UsuarioEmpresa $usuarioEmpresa): static
    {
        if ($this->usuarioEmpresas->removeElement($usuarioEmpresa)) {
            // set the owning side to null (unless already changed)
            if ($usuarioEmpresa->getEmpresa() === $this) {
                $usuarioEmpresa->setEmpresa(null);
            }
        }

        return $this;
    }
}
