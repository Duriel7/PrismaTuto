-- CreateTable
CREATE TABLE "origins" (
    "id_origin" DECIMAL(4,0) NOT NULL,
    "continent" VARCHAR(25) NOT NULL,
    "land" VARCHAR(25) NOT NULL,
    "city" VARCHAR(25) NOT NULL,

    CONSTRAINT "pk_origin" PRIMARY KEY ("id_origin")
);

-- CreateTable
CREATE TABLE "t_characters" (
    "id" DECIMAL(4,0) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "class" VARCHAR(25) NOT NULL,
    "job" VARCHAR(50) NOT NULL,
    "origin" VARCHAR(25) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk_id" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_classes" (
    "id_class" DECIMAL(4,0) NOT NULL,
    "name" VARCHAR(25) NOT NULL,
    "specialization" VARCHAR(25) NOT NULL,
    "overclass_first" DECIMAL(4,0),
    "overclass_second" DECIMAL(4,0),

    CONSTRAINT "pk_idclass" PRIMARY KEY ("id_class")
);

-- CreateTable
CREATE TABLE "t_jobs" (
    "id_job" DECIMAL(4,0) NOT NULL,
    "name" VARCHAR(25) NOT NULL,
    "specialization" VARCHAR(25) NOT NULL,

    CONSTRAINT "pk_idjob" PRIMARY KEY ("id_job")
);

-- CreateTable
CREATE TABLE "t_overclasses" (
    "id_overclass" DECIMAL(4,0) NOT NULL,
    "name" VARCHAR(25) NOT NULL,
    "specialization" VARCHAR(25) NOT NULL,
    "underclass" DECIMAL(4,0) NOT NULL,

    CONSTRAINT "pk_idoverclass" PRIMARY KEY ("id_overclass")
);

-- AddForeignKey
ALTER TABLE "t_classes" ADD CONSTRAINT "fk_overclassfirst" FOREIGN KEY ("overclass_first") REFERENCES "t_overclasses"("id_overclass") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "t_classes" ADD CONSTRAINT "fk_overclasssecond" FOREIGN KEY ("overclass_second") REFERENCES "t_overclasses"("id_overclass") ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "t_overclasses" ADD CONSTRAINT "fk_class" FOREIGN KEY ("underclass") REFERENCES "t_classes"("id_class") ON DELETE RESTRICT ON UPDATE RESTRICT;
