/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `PaymentMethod` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "cancelReason" TEXT,
ADD COLUMN     "paidAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "OrderItem" ADD COLUMN     "partnerId" TEXT,
ADD COLUMN     "productImage" TEXT,
ADD COLUMN     "productSku" TEXT,
ADD COLUMN     "productTitle" TEXT;

-- AlterTable
ALTER TABLE "Partner" ADD COLUMN     "alifTerminalId" TEXT,
ADD COLUMN     "bankAccount" TEXT,
ADD COLUMN     "bankName" TEXT,
ADD COLUMN     "bik" TEXT,
ADD COLUMN     "cardAccount" TEXT;

-- AlterTable
ALTER TABLE "PaymentAttempt" ADD COLUMN     "errorMessage" TEXT,
ADD COLUMN     "metadata" JSONB,
ADD COLUMN     "paymentUrl" TEXT;

-- AlterTable
ALTER TABLE "PaymentMethod" ADD COLUMN     "code" TEXT,
ADD COLUMN     "icon" TEXT,
ADD COLUMN     "provider" TEXT;

-- AlterTable
ALTER TABLE "Transaction" ADD COLUMN     "metadata" JSONB,
ADD COLUMN     "payerAccount" TEXT,
ADD COLUMN     "payerPhone" TEXT,
ADD COLUMN     "paymentGate" TEXT;

-- CreateTable
CREATE TABLE "SavedCard" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "cardToken" TEXT NOT NULL,
    "cardMask" TEXT NOT NULL,
    "cardType" TEXT,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SavedCard_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "SavedCard_userId_idx" ON "SavedCard"("userId");

-- CreateIndex
CREATE INDEX "Order_paymentStatus_idx" ON "Order"("paymentStatus");

-- CreateIndex
CREATE INDEX "Order_createdAt_idx" ON "Order"("createdAt");

-- CreateIndex
CREATE INDEX "OrderItem_partnerId_idx" ON "OrderItem"("partnerId");

-- CreateIndex
CREATE INDEX "PaymentAttempt_orderId_idx" ON "PaymentAttempt"("orderId");

-- CreateIndex
CREATE INDEX "PaymentAttempt_userId_idx" ON "PaymentAttempt"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentMethod_code_key" ON "PaymentMethod"("code");

-- CreateIndex
CREATE INDEX "Transaction_userId_idx" ON "Transaction"("userId");

-- CreateIndex
CREATE INDEX "Transaction_providerId_idx" ON "Transaction"("providerId");

-- CreateIndex
CREATE INDEX "User_telegramId_idx" ON "User"("telegramId");

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_partnerId_fkey" FOREIGN KEY ("partnerId") REFERENCES "Partner"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedCard" ADD CONSTRAINT "SavedCard_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
