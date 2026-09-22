/*
  Warnings:

  - A unique constraint covering the columns `[cardToken]` on the table `SavedCard` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Partner" ADD COLUMN     "cardBank" TEXT,
ADD COLUMN     "cardHolder" TEXT,
ADD COLUMN     "payoutPhone" TEXT;

-- AlterTable
ALTER TABLE "SavedCard" ADD COLUMN     "bankName" TEXT,
ADD COLUMN     "expireDate" TEXT,
ADD COLUMN     "isActive" BOOLEAN NOT NULL DEFAULT true;

-- CreateIndex
CREATE UNIQUE INDEX "SavedCard_cardToken_key" ON "SavedCard"("cardToken");

-- CreateIndex
CREATE INDEX "SavedCard_userId_isDefault_idx" ON "SavedCard"("userId", "isDefault");
