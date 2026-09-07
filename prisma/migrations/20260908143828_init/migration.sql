/*
  Warnings:

  - You are about to drop the column `message` on the `Banner` table. All the data in the column will be lost.
  - Added the required column `description` to the `Banner` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Banner" DROP COLUMN "message",
ADD COLUMN     "description" TEXT NOT NULL;
