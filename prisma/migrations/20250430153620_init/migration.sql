-- CreateTable
CREATE TABLE "Entries" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "genus" TEXT NOT NULL,
    "isBaby" BOOLEAN NOT NULL,
    "isLegendary" BOOLEAN NOT NULL,
    "isMythical" BOOLEAN NOT NULL,
    "order" INTEGER NOT NULL,

    PRIMARY KEY ("id", "name")
);

-- CreateIndex
CREATE INDEX "index_pokemon_name" ON "Entries"("name");
