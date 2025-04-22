/*
  Warnings:

  - You are about to alter the column `appeal` on the `contest_effects` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `jam` on the `contest_effects` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `accuracy` on the `move_changelog` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `power` on the `move_changelog` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `pp` on the `move_changelog` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `priority` on the `move_changelog` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `accuracy` on the `moves` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `power` on the `moves` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `pp` on the `moves` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `priority` on the `moves` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.
  - You are about to alter the column `appeal` on the `super_contest_effects` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("smallint")` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_contest_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" INTEGER NOT NULL,
    "jam" INTEGER NOT NULL
);
INSERT INTO "new_contest_effects" ("appeal", "id", "jam") SELECT "appeal", "id", "jam" FROM "contest_effects";
DROP TABLE "contest_effects";
ALTER TABLE "new_contest_effects" RENAME TO "contest_effects";
CREATE TABLE "new_move_changelog" (
    "move_id" INTEGER NOT NULL,
    "changed_in_version_group_id" INTEGER NOT NULL,
    "type_id" INTEGER,
    "power" INTEGER,
    "pp" INTEGER,
    "accuracy" INTEGER,
    "priority" INTEGER,
    "target_id" INTEGER,
    "effect_id" INTEGER,
    "effect_chance" INTEGER,

    PRIMARY KEY ("move_id", "changed_in_version_group_id"),
    CONSTRAINT "move_changelog_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_changelog_target_id_fkey" FOREIGN KEY ("target_id") REFERENCES "move_targets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_changelog_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_changelog_changed_in_version_group_id_fkey" FOREIGN KEY ("changed_in_version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_changelog_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_move_changelog" ("accuracy", "changed_in_version_group_id", "effect_chance", "effect_id", "move_id", "power", "pp", "priority", "target_id", "type_id") SELECT "accuracy", "changed_in_version_group_id", "effect_chance", "effect_id", "move_id", "power", "pp", "priority", "target_id", "type_id" FROM "move_changelog";
DROP TABLE "move_changelog";
ALTER TABLE "new_move_changelog" RENAME TO "move_changelog";
CREATE TABLE "new_moves" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "power" INTEGER,
    "pp" INTEGER,
    "accuracy" INTEGER,
    "priority" INTEGER NOT NULL,
    "target_id" INTEGER NOT NULL,
    "damage_class_id" INTEGER NOT NULL,
    "effect_id" INTEGER NOT NULL,
    "effect_chance" INTEGER,
    "contest_type_id" INTEGER,
    "contest_effect_id" INTEGER,
    "super_contest_effect_id" INTEGER,
    CONSTRAINT "moves_super_contest_effect_id_fkey" FOREIGN KEY ("super_contest_effect_id") REFERENCES "super_contest_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_contest_effect_id_fkey" FOREIGN KEY ("contest_effect_id") REFERENCES "contest_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "contest_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_damage_class_id_fkey" FOREIGN KEY ("damage_class_id") REFERENCES "move_damage_classes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_target_id_fkey" FOREIGN KEY ("target_id") REFERENCES "move_targets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moves_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_moves" ("accuracy", "contest_effect_id", "contest_type_id", "damage_class_id", "effect_chance", "effect_id", "generation_id", "id", "identifier", "power", "pp", "priority", "super_contest_effect_id", "target_id", "type_id") SELECT "accuracy", "contest_effect_id", "contest_type_id", "damage_class_id", "effect_chance", "effect_id", "generation_id", "id", "identifier", "power", "pp", "priority", "super_contest_effect_id", "target_id", "type_id" FROM "moves";
DROP TABLE "moves";
ALTER TABLE "new_moves" RENAME TO "moves";
CREATE TABLE "new_super_contest_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" INTEGER NOT NULL
);
INSERT INTO "new_super_contest_effects" ("appeal", "id") SELECT "appeal", "id" FROM "super_contest_effects";
DROP TABLE "super_contest_effects";
ALTER TABLE "new_super_contest_effects" RENAME TO "super_contest_effects";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
