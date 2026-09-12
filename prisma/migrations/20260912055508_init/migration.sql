/*
  Warnings:

  - You are about to drop the column `variantId` on the `ProductVariant` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ProductVariant" DROP CONSTRAINT "ProductVariant_variantId_fkey";

-- AlterTable
ALTER TABLE "ProductVariant" DROP COLUMN "variantId";
