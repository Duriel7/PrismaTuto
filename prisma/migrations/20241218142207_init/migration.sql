/*
  Warnings:

  - You are about to drop the `origins` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `t_characters` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `t_classes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `t_jobs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `t_overclasses` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "t_classes" DROP CONSTRAINT "fk_overclassfirst";

-- DropForeignKey
ALTER TABLE "t_classes" DROP CONSTRAINT "fk_overclasssecond";

-- DropForeignKey
ALTER TABLE "t_overclasses" DROP CONSTRAINT "fk_class";

-- DropTable
DROP TABLE "origins";

-- DropTable
DROP TABLE "t_characters";

-- DropTable
DROP TABLE "t_classes";

-- DropTable
DROP TABLE "t_jobs";

-- DropTable
DROP TABLE "t_overclasses";

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "authorId" INTEGER NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "bio" TEXT,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
