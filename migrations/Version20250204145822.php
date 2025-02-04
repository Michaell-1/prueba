<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250204145822 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE usuario_empresa (id SERIAL NOT NULL, usuario_id INT NOT NULL, empresa_id INT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_C1F1F017DB38439E ON usuario_empresa (usuario_id)');
        $this->addSql('CREATE INDEX IDX_C1F1F017521E1991 ON usuario_empresa (empresa_id)');
        $this->addSql('ALTER TABLE usuario_empresa ADD CONSTRAINT FK_C1F1F017DB38439E FOREIGN KEY (usuario_id) REFERENCES usuario (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE usuario_empresa ADD CONSTRAINT FK_C1F1F017521E1991 FOREIGN KEY (empresa_id) REFERENCES empresa (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE usuario_empresa DROP CONSTRAINT FK_C1F1F017DB38439E');
        $this->addSql('ALTER TABLE usuario_empresa DROP CONSTRAINT FK_C1F1F017521E1991');
        $this->addSql('DROP TABLE usuario_empresa');
    }
}
