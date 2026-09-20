/*
  Warnings:

  - The values [PENDING] on the enum `ReviewStatus` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `images` on the `Review` table. All the data in the column will be lost.
  - You are about to drop the column `likesCount` on the `Review` table. All the data in the column will be lost.

*/
-- AlterEnum
ALTER TYPE "NotificationType" ADD VALUE 'REVIEW_STATUS';

-- AlterEnum
BEGIN;
CREATE TYPE "ReviewStatus_new" AS ENUM ('AUTO_MODERATION', 'MANUAL_MODERATION', 'PUBLISHED', 'REJECTED', 'HIDDEN');
ALTER TABLE "public"."Review" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "Review" ALTER COLUMN "status" TYPE "ReviewStatus_new" USING ("status"::text::"ReviewStatus_new");
ALTER TYPE "ReviewStatus" RENAME TO "ReviewStatus_old";
ALTER TYPE "ReviewStatus_new" RENAME TO "ReviewStatus";
DROP TYPE "public"."ReviewStatus_old";
ALTER TABLE "Review" ALTER COLUMN "status" SET DEFAULT 'AUTO_MODERATION';
COMMIT;

-- AlterTable
ALTER TABLE "Review" DROP COLUMN "images",
DROP COLUMN "likesCount",
ALTER COLUMN "status" SET DEFAULT 'AUTO_MODERATION';
