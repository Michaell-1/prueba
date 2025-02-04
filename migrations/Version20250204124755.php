<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250204124755 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE empresa ADD nombre VARCHAR(100) NOT NULL');
        $this->addSql('ALTER TABLE empresa ADD ruc INT NOT NULL');
        $this->addSql('ALTER TABLE empresa ADD dueño VARCHAR(200) NOT NULL');
        $this->addSql('ALTER TABLE empresa ADD contacto INT NOT NULL');
        $this->addSql('ALTER TABLE empresa ADD ubicacion VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE empresa DROP nombre');
        $this->addSql('ALTER TABLE empresa DROP ruc');
        $this->addSql('ALTER TABLE empresa DROP dueño');
        $this->addSql('ALTER TABLE empresa DROP contacto');
        $this->addSql('ALTER TABLE empresa DROP ubicacion');
    }
}
