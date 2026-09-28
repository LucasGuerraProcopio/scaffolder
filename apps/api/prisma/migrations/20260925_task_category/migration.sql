-- Migration: 20260925_task_category
-- Description: Adiciona categoria às tarefas (enum TaskCategory) com valor padrão GENERAL

-- Consulta 001: Criação do tipo enum de categoria
CREATE TYPE "TaskCategory" AS ENUM ('GENERAL', 'WORK', 'STUDY', 'PERSONAL', 'HEALTH', 'FINANCE');

-- Consulta 002: Nova coluna em tasks (tarefas existentes recebem GENERAL)
ALTER TABLE "tasks" ADD COLUMN "category" "TaskCategory" NOT NULL DEFAULT 'GENERAL';

-- Consulta 003: Índice para filtro por categoria
CREATE INDEX "tasks_category_idx" ON "tasks"("category");
