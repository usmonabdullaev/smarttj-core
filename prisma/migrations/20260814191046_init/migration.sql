/*
  Warnings:

  - A unique constraint covering the columns `[slug]` on the table `Category` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `Region` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "Brand_slug_idx";

-- DropIndex
DROP INDEX "Cart_userId_idx";

-- DropIndex
DROP INDEX "Category_parentId_idx";

-- DropIndex
DROP INDEX "Category_parentKey_slug_key";

-- DropIndex
DROP INDEX "Model_brandId_idx";

-- DropIndex
DROP INDEX "Model_slug_idx";

-- DropIndex
DROP INDEX "Report_year_idx";

-- DropIndex
DROP INDEX "SupportChat_assignedToId_idx";

-- DropIndex
DROP INDEX "SupportChat_status_idx";

-- DropIndex
DROP INDEX "SupportChat_userId_idx";

-- DropIndex
DROP INDEX "SupportMessage_chatId_idx";

-- DropIndex
DROP INDEX "SupportMessage_role_idx";

-- CreateIndex
CREATE UNIQUE INDEX "Category_slug_key" ON "Category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Region_slug_key" ON "Region"("slug");
