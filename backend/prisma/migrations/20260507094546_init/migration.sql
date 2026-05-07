-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "College" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "fees" DOUBLE PRECISION NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "placementPercentage" DOUBLE PRECISION NOT NULL,
    "courses" JSONB NOT NULL,
    "summary" TEXT NOT NULL DEFAULT 'A premier institution offering excellent academic programs.',
    "entranceExam" TEXT NOT NULL DEFAULT 'JEE Main',
    "minRankGen" INTEGER NOT NULL DEFAULT 0,
    "maxRankGen" INTEGER NOT NULL DEFAULT 0,
    "minRankObc" INTEGER NOT NULL DEFAULT 0,
    "maxRankObc" INTEGER NOT NULL DEFAULT 0,
    "minRankEws" INTEGER NOT NULL DEFAULT 0,
    "maxRankEws" INTEGER NOT NULL DEFAULT 0,
    "minRankSc" INTEGER NOT NULL DEFAULT 0,
    "maxRankSc" INTEGER NOT NULL DEFAULT 0,
    "minRankSt" INTEGER NOT NULL DEFAULT 0,
    "maxRankSt" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "College_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavedCollege" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "collegeId" TEXT NOT NULL,

    CONSTRAINT "SavedCollege_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "SavedCollege_userId_collegeId_key" ON "SavedCollege"("userId", "collegeId");

-- AddForeignKey
ALTER TABLE "SavedCollege" ADD CONSTRAINT "SavedCollege_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedCollege" ADD CONSTRAINT "SavedCollege_collegeId_fkey" FOREIGN KEY ("collegeId") REFERENCES "College"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
