/*
  Warnings:

  - You are about to drop the column `transactionReference` on the `PayoutRequest` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "PayoutRequest" DROP COLUMN "transactionReference",
ADD COLUMN     "checkUrl" TEXT,
ADD COLUMN     "checkUrlId" TEXT;
