-- AlterTable
ALTER TABLE "PaymentMethod" ADD COLUMN     "commissionRate" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "Transaction" ADD COLUMN     "commissionAmount" INTEGER DEFAULT 0,
ADD COLUMN     "commissionRate" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "netAmount" INTEGER;
