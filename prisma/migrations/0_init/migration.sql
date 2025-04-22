-- CreateTable
CREATE TABLE "abilities" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "is_main_series" BOOLEAN NOT NULL,
    CONSTRAINT "abilities_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "ability_changelog" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ability_id" INTEGER NOT NULL,
    "changed_in_version_group_id" INTEGER NOT NULL,
    CONSTRAINT "ability_changelog_changed_in_version_group_id_fkey" FOREIGN KEY ("changed_in_version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_changelog_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "ability_changelog_prose" (
    "ability_changelog_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "effect" TEXT NOT NULL,

    PRIMARY KEY ("ability_changelog_id", "local_language_id"),
    CONSTRAINT "ability_changelog_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_changelog_prose_ability_changelog_id_fkey" FOREIGN KEY ("ability_changelog_id") REFERENCES "ability_changelog" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "ability_flavor_text" (
    "ability_id" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "flavor_text" TEXT NOT NULL,

    PRIMARY KEY ("ability_id", "version_group_id", "language_id"),
    CONSTRAINT "ability_flavor_text_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_flavor_text_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_flavor_text_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "ability_names" (
    "ability_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("ability_id", "local_language_id"),
    CONSTRAINT "ability_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_names_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "ability_prose" (
    "ability_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "short_effect" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("ability_id", "local_language_id"),
    CONSTRAINT "ability_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "ability_prose_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "berries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_id" INTEGER NOT NULL,
    "firmness_id" INTEGER NOT NULL,
    "natural_gift_power" INTEGER,
    "natural_gift_type_id" INTEGER,
    "size" INTEGER NOT NULL,
    "max_harvest" INTEGER NOT NULL,
    "growth_time" INTEGER NOT NULL,
    "soil_dryness" INTEGER NOT NULL,
    "smoothness" INTEGER NOT NULL,
    CONSTRAINT "berries_natural_gift_type_id_fkey" FOREIGN KEY ("natural_gift_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "berries_firmness_id_fkey" FOREIGN KEY ("firmness_id") REFERENCES "berry_firmness" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "berries_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "berry_firmness" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "berry_firmness_names" (
    "berry_firmness_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("berry_firmness_id", "local_language_id"),
    CONSTRAINT "berry_firmness_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "berry_firmness_names_berry_firmness_id_fkey" FOREIGN KEY ("berry_firmness_id") REFERENCES "berry_firmness" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "berry_flavors" (
    "berry_id" INTEGER NOT NULL,
    "contest_type_id" INTEGER NOT NULL,
    "flavor" INTEGER NOT NULL,

    PRIMARY KEY ("berry_id", "contest_type_id"),
    CONSTRAINT "berry_flavors_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "contest_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "berry_flavors_berry_id_fkey" FOREIGN KEY ("berry_id") REFERENCES "berries" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "characteristic_text" (
    "characteristic_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "message" TEXT NOT NULL,

    PRIMARY KEY ("characteristic_id", "local_language_id"),
    CONSTRAINT "characteristic_text_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "characteristic_text_characteristic_id_fkey" FOREIGN KEY ("characteristic_id") REFERENCES "characteristics" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "characteristics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "stat_id" INTEGER NOT NULL,
    "gene_mod_5" INTEGER NOT NULL,
    CONSTRAINT "characteristics_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_episode_names" (
    "episode_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("episode_id", "local_language_id"),
    CONSTRAINT "conquest_episode_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_episode_names_episode_id_fkey" FOREIGN KEY ("episode_id") REFERENCES "conquest_episodes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_episode_warriors" (
    "episode_id" INTEGER NOT NULL,
    "warrior_id" INTEGER NOT NULL,

    PRIMARY KEY ("episode_id", "warrior_id"),
    CONSTRAINT "conquest_episode_warriors_warrior_id_fkey" FOREIGN KEY ("warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_episode_warriors_episode_id_fkey" FOREIGN KEY ("episode_id") REFERENCES "conquest_episodes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_episodes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_kingdom_names" (
    "kingdom_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("kingdom_id", "local_language_id"),
    CONSTRAINT "conquest_kingdom_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_kingdom_names_kingdom_id_fkey" FOREIGN KEY ("kingdom_id") REFERENCES "conquest_kingdoms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_kingdoms" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "type_id" INTEGER NOT NULL,
    CONSTRAINT "conquest_kingdoms_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_max_links" (
    "warrior_rank_id" INTEGER NOT NULL,
    "pokemon_species_id" INTEGER NOT NULL,
    "max_link" INTEGER NOT NULL,

    PRIMARY KEY ("warrior_rank_id", "pokemon_species_id"),
    CONSTRAINT "conquest_max_links_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_max_links_warrior_rank_id_fkey" FOREIGN KEY ("warrior_rank_id") REFERENCES "conquest_warrior_ranks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_move_data" (
    "move_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "power" INTEGER,
    "accuracy" INTEGER,
    "effect_chance" INTEGER,
    "effect_id" INTEGER NOT NULL,
    "range_id" INTEGER NOT NULL,
    "displacement_id" INTEGER,
    CONSTRAINT "conquest_move_data_displacement_id_fkey" FOREIGN KEY ("displacement_id") REFERENCES "conquest_move_displacements" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_data_range_id_fkey" FOREIGN KEY ("range_id") REFERENCES "conquest_move_ranges" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_data_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "conquest_move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_data_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_move_displacement_prose" (
    "move_displacement_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "short_effect" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("move_displacement_id", "local_language_id"),
    CONSTRAINT "conquest_move_displacement_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_displacement_prose_move_displacement_id_fkey" FOREIGN KEY ("move_displacement_id") REFERENCES "conquest_move_displacements" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_move_displacements" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "affects_target" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_move_effect_prose" (
    "conquest_move_effect_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "short_effect" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("conquest_move_effect_id", "local_language_id"),
    CONSTRAINT "conquest_move_effect_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_effect_prose_conquest_move_effect_id_fkey" FOREIGN KEY ("conquest_move_effect_id") REFERENCES "conquest_move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_move_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "conquest_move_range_prose" (
    "conquest_move_range_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("conquest_move_range_id", "local_language_id"),
    CONSTRAINT "conquest_move_range_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_move_range_prose_conquest_move_range_id_fkey" FOREIGN KEY ("conquest_move_range_id") REFERENCES "conquest_move_ranges" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_move_ranges" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "targets" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_pokemon_abilities" (
    "pokemon_species_id" INTEGER NOT NULL,
    "slot" INTEGER NOT NULL,
    "ability_id" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_species_id", "slot"),
    CONSTRAINT "conquest_pokemon_abilities_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_abilities_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_pokemon_evolution" (
    "evolved_species_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "required_stat_id" INTEGER,
    "minimum_stat" INTEGER,
    "minimum_link" INTEGER,
    "kingdom_id" INTEGER,
    "warrior_gender_id" INTEGER,
    "item_id" INTEGER,
    "recruiting_ko_required" BOOLEAN NOT NULL,
    CONSTRAINT "conquest_pokemon_evolution_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_evolution_warrior_gender_id_fkey" FOREIGN KEY ("warrior_gender_id") REFERENCES "genders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_evolution_kingdom_id_fkey" FOREIGN KEY ("kingdom_id") REFERENCES "conquest_kingdoms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_evolution_required_stat_id_fkey" FOREIGN KEY ("required_stat_id") REFERENCES "conquest_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_evolution_evolved_species_id_fkey" FOREIGN KEY ("evolved_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_pokemon_moves" (
    "pokemon_species_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "move_id" INTEGER NOT NULL,
    CONSTRAINT "conquest_pokemon_moves_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_moves_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_pokemon_stats" (
    "pokemon_species_id" INTEGER NOT NULL,
    "conquest_stat_id" INTEGER NOT NULL,
    "base_stat" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_species_id", "conquest_stat_id"),
    CONSTRAINT "conquest_pokemon_stats_conquest_stat_id_fkey" FOREIGN KEY ("conquest_stat_id") REFERENCES "conquest_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_pokemon_stats_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_stat_names" (
    "conquest_stat_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("conquest_stat_id", "local_language_id"),
    CONSTRAINT "conquest_stat_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_stat_names_conquest_stat_id_fkey" FOREIGN KEY ("conquest_stat_id") REFERENCES "conquest_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_stats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "is_base" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_transformation_pokemon" (
    "transformation_id" INTEGER NOT NULL,
    "pokemon_species_id" INTEGER NOT NULL,

    PRIMARY KEY ("transformation_id", "pokemon_species_id"),
    CONSTRAINT "conquest_transformation_pokemon_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_transformation_pokemon_transformation_id_fkey" FOREIGN KEY ("transformation_id") REFERENCES "conquest_warrior_transformation" ("transformed_warrior_rank_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_transformation_warriors" (
    "transformation_id" INTEGER NOT NULL,
    "present_warrior_id" INTEGER NOT NULL,

    PRIMARY KEY ("transformation_id", "present_warrior_id"),
    CONSTRAINT "conquest_transformation_warriors_present_warrior_id_fkey" FOREIGN KEY ("present_warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_transformation_warriors_transformation_id_fkey" FOREIGN KEY ("transformation_id") REFERENCES "conquest_warrior_transformation" ("transformed_warrior_rank_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_archetypes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_warrior_names" (
    "warrior_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("warrior_id", "local_language_id"),
    CONSTRAINT "conquest_warrior_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_names_warrior_id_fkey" FOREIGN KEY ("warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_rank_stat_map" (
    "warrior_rank_id" INTEGER NOT NULL,
    "warrior_stat_id" INTEGER NOT NULL,
    "base_stat" INTEGER NOT NULL,

    PRIMARY KEY ("warrior_rank_id", "warrior_stat_id"),
    CONSTRAINT "conquest_warrior_rank_stat_map_warrior_stat_id_fkey" FOREIGN KEY ("warrior_stat_id") REFERENCES "conquest_warrior_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_rank_stat_map_warrior_rank_id_fkey" FOREIGN KEY ("warrior_rank_id") REFERENCES "conquest_warrior_ranks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_ranks" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "warrior_id" INTEGER NOT NULL,
    "rank" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,
    CONSTRAINT "conquest_warrior_ranks_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "conquest_warrior_skills" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_ranks_warrior_id_fkey" FOREIGN KEY ("warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_skill_names" (
    "skill_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("skill_id", "local_language_id"),
    CONSTRAINT "conquest_warrior_skill_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_skill_names_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "conquest_warrior_skills" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_skills" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_warrior_specialties" (
    "warrior_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "slot" INTEGER NOT NULL,

    PRIMARY KEY ("warrior_id", "type_id", "slot"),
    CONSTRAINT "conquest_warrior_specialties_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_specialties_warrior_id_fkey" FOREIGN KEY ("warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_stat_names" (
    "warrior_stat_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("warrior_stat_id", "local_language_id"),
    CONSTRAINT "conquest_warrior_stat_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_stat_names_warrior_stat_id_fkey" FOREIGN KEY ("warrior_stat_id") REFERENCES "conquest_warrior_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warrior_stats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "conquest_warrior_transformation" (
    "transformed_warrior_rank_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_automatic" BOOLEAN NOT NULL,
    "required_link" INTEGER,
    "completed_episode_id" INTEGER,
    "current_episode_id" INTEGER,
    "distant_warrior_id" INTEGER,
    "female_warlord_count" INTEGER,
    "pokemon_count" INTEGER,
    "collection_type_id" INTEGER,
    "warrior_count" INTEGER,
    CONSTRAINT "conquest_warrior_transformation_collection_type_id_fkey" FOREIGN KEY ("collection_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_transformation_distant_warrior_id_fkey" FOREIGN KEY ("distant_warrior_id") REFERENCES "conquest_warriors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_transformation_current_episode_id_fkey" FOREIGN KEY ("current_episode_id") REFERENCES "conquest_episodes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_transformation_completed_episode_id_fkey" FOREIGN KEY ("completed_episode_id") REFERENCES "conquest_episodes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warrior_transformation_transformed_warrior_rank_id_fkey" FOREIGN KEY ("transformed_warrior_rank_id") REFERENCES "conquest_warrior_ranks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "conquest_warriors" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "gender_id" INTEGER NOT NULL,
    "archetype_id" INTEGER,
    CONSTRAINT "conquest_warriors_archetype_id_fkey" FOREIGN KEY ("archetype_id") REFERENCES "conquest_warrior_archetypes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "conquest_warriors_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "contest_combos" (
    "first_move_id" INTEGER NOT NULL,
    "second_move_id" INTEGER NOT NULL,

    PRIMARY KEY ("first_move_id", "second_move_id"),
    CONSTRAINT "contest_combos_second_move_id_fkey" FOREIGN KEY ("second_move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "contest_combos_first_move_id_fkey" FOREIGN KEY ("first_move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "contest_effect_prose" (
    "contest_effect_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "flavor_text" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("contest_effect_id", "local_language_id"),
    CONSTRAINT "contest_effect_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "contest_effect_prose_contest_effect_id_fkey" FOREIGN KEY ("contest_effect_id") REFERENCES "contest_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "contest_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" smallint NOT NULL,
    "jam" smallint NOT NULL
);

-- CreateTable
CREATE TABLE "contest_type_names" (
    "contest_type_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "flavor" TEXT,
    "color" TEXT,

    PRIMARY KEY ("contest_type_id", "local_language_id"),
    CONSTRAINT "contest_type_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "contest_type_names_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "contest_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "contest_types" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "egg_group_prose" (
    "egg_group_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("egg_group_id", "local_language_id"),
    CONSTRAINT "egg_group_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "egg_group_prose_egg_group_id_fkey" FOREIGN KEY ("egg_group_id") REFERENCES "egg_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "egg_groups" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "encounter_condition_prose" (
    "encounter_condition_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("encounter_condition_id", "local_language_id"),
    CONSTRAINT "encounter_condition_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounter_condition_prose_encounter_condition_id_fkey" FOREIGN KEY ("encounter_condition_id") REFERENCES "encounter_conditions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounter_condition_value_map" (
    "encounter_id" INTEGER NOT NULL,
    "encounter_condition_value_id" INTEGER NOT NULL,

    PRIMARY KEY ("encounter_id", "encounter_condition_value_id"),
    CONSTRAINT "encounter_condition_value_map_encounter_condition_value_id_fkey" FOREIGN KEY ("encounter_condition_value_id") REFERENCES "encounter_condition_values" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounter_condition_value_map_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "encounters" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounter_condition_value_prose" (
    "encounter_condition_value_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("encounter_condition_value_id", "local_language_id"),
    CONSTRAINT "encounter_condition_value_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounter_condition_value_prose_encounter_condition_value_id_fkey" FOREIGN KEY ("encounter_condition_value_id") REFERENCES "encounter_condition_values" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounter_condition_values" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "encounter_condition_id" INTEGER NOT NULL,
    "identifier" TEXT NOT NULL,
    "is_default" BOOLEAN NOT NULL,
    CONSTRAINT "encounter_condition_values_encounter_condition_id_fkey" FOREIGN KEY ("encounter_condition_id") REFERENCES "encounter_conditions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounter_conditions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "encounter_method_prose" (
    "encounter_method_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("encounter_method_id", "local_language_id"),
    CONSTRAINT "encounter_method_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounter_method_prose_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "encounter_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounter_methods" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "order" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "encounter_slots" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "version_group_id" INTEGER NOT NULL,
    "encounter_method_id" INTEGER NOT NULL,
    "slot" INTEGER,
    "rarity" INTEGER,
    CONSTRAINT "encounter_slots_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "encounter_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounter_slots_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "encounters" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "version_id" INTEGER NOT NULL,
    "location_area_id" INTEGER NOT NULL,
    "encounter_slot_id" INTEGER NOT NULL,
    "pokemon_id" INTEGER NOT NULL,
    "min_level" INTEGER NOT NULL,
    "max_level" INTEGER NOT NULL,
    CONSTRAINT "encounters_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounters_encounter_slot_id_fkey" FOREIGN KEY ("encounter_slot_id") REFERENCES "encounter_slots" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounters_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "location_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "encounters_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "evolution_chains" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "baby_trigger_item_id" INTEGER,
    CONSTRAINT "evolution_chains_baby_trigger_item_id_fkey" FOREIGN KEY ("baby_trigger_item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "evolution_trigger_prose" (
    "evolution_trigger_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("evolution_trigger_id", "local_language_id"),
    CONSTRAINT "evolution_trigger_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "evolution_trigger_prose_evolution_trigger_id_fkey" FOREIGN KEY ("evolution_trigger_id") REFERENCES "evolution_triggers" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "evolution_triggers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "experience" (
    "growth_rate_id" INTEGER NOT NULL,
    "level" INTEGER NOT NULL,
    "experience" INTEGER NOT NULL,

    PRIMARY KEY ("growth_rate_id", "level"),
    CONSTRAINT "experience_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "growth_rates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "genders" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "generation_names" (
    "generation_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("generation_id", "local_language_id"),
    CONSTRAINT "generation_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "generation_names_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "generations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "main_region_id" INTEGER NOT NULL,
    "identifier" TEXT NOT NULL,
    CONSTRAINT "generations_main_region_id_fkey" FOREIGN KEY ("main_region_id") REFERENCES "regions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "growth_rate_prose" (
    "growth_rate_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("growth_rate_id", "local_language_id"),
    CONSTRAINT "growth_rate_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "growth_rate_prose_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "growth_rates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "growth_rates" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "formula" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "item_categories" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pocket_id" INTEGER NOT NULL,
    "identifier" TEXT NOT NULL,
    CONSTRAINT "item_categories_pocket_id_fkey" FOREIGN KEY ("pocket_id") REFERENCES "item_pockets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_category_prose" (
    "item_category_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("item_category_id", "local_language_id"),
    CONSTRAINT "item_category_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_category_prose_item_category_id_fkey" FOREIGN KEY ("item_category_id") REFERENCES "item_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_flag_map" (
    "item_id" INTEGER NOT NULL,
    "item_flag_id" INTEGER NOT NULL,

    PRIMARY KEY ("item_id", "item_flag_id"),
    CONSTRAINT "item_flag_map_item_flag_id_fkey" FOREIGN KEY ("item_flag_id") REFERENCES "item_flags" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_flag_map_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_flag_prose" (
    "item_flag_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("item_flag_id", "local_language_id"),
    CONSTRAINT "item_flag_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_flag_prose_item_flag_id_fkey" FOREIGN KEY ("item_flag_id") REFERENCES "item_flags" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_flags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "item_flavor_summaries" (
    "item_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "flavor_summary" TEXT,

    PRIMARY KEY ("item_id", "local_language_id"),
    CONSTRAINT "item_flavor_summaries_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_flavor_summaries_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_flavor_text" (
    "item_id" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "flavor_text" TEXT NOT NULL,

    PRIMARY KEY ("item_id", "version_group_id", "language_id"),
    CONSTRAINT "item_flavor_text_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_flavor_text_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_flavor_text_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_fling_effect_prose" (
    "item_fling_effect_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "effect" TEXT NOT NULL,

    PRIMARY KEY ("item_fling_effect_id", "local_language_id"),
    CONSTRAINT "item_fling_effect_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_fling_effect_prose_item_fling_effect_id_fkey" FOREIGN KEY ("item_fling_effect_id") REFERENCES "item_fling_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_fling_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "item_game_indices" (
    "item_id" INTEGER NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,

    PRIMARY KEY ("item_id", "generation_id"),
    CONSTRAINT "item_game_indices_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_game_indices_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_names" (
    "item_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("item_id", "local_language_id"),
    CONSTRAINT "item_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_names_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_pocket_names" (
    "item_pocket_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("item_pocket_id", "local_language_id"),
    CONSTRAINT "item_pocket_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_pocket_names_item_pocket_id_fkey" FOREIGN KEY ("item_pocket_id") REFERENCES "item_pockets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "item_pockets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "item_prose" (
    "item_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "short_effect" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("item_id", "local_language_id"),
    CONSTRAINT "item_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "item_prose_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "items" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL,
    "cost" INTEGER NOT NULL,
    "fling_power" INTEGER,
    "fling_effect_id" INTEGER,
    CONSTRAINT "items_fling_effect_id_fkey" FOREIGN KEY ("fling_effect_id") REFERENCES "item_fling_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "items_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "item_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "language_names" (
    "language_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("language_id", "local_language_id"),
    CONSTRAINT "language_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "language_names_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "languages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "iso639" TEXT NOT NULL,
    "iso3166" TEXT NOT NULL,
    "identifier" TEXT NOT NULL,
    "official" BOOLEAN NOT NULL,
    "order" INTEGER
);

-- CreateTable
CREATE TABLE "location_area_encounter_rates" (
    "location_area_id" INTEGER NOT NULL,
    "encounter_method_id" INTEGER NOT NULL,
    "version_id" INTEGER NOT NULL,
    "rate" INTEGER,

    PRIMARY KEY ("location_area_id", "encounter_method_id", "version_id"),
    CONSTRAINT "location_area_encounter_rates_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "location_area_encounter_rates_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "encounter_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "location_area_encounter_rates_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "location_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "location_area_prose" (
    "location_area_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,

    PRIMARY KEY ("location_area_id", "local_language_id"),
    CONSTRAINT "location_area_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "location_area_prose_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "location_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "location_areas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "location_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,
    "identifier" TEXT,
    CONSTRAINT "location_areas_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "location_game_indices" (
    "location_id" INTEGER NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,

    PRIMARY KEY ("location_id", "generation_id", "game_index"),
    CONSTRAINT "location_game_indices_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "location_game_indices_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "location_names" (
    "location_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("location_id", "local_language_id"),
    CONSTRAINT "location_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "location_names_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "locations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "region_id" INTEGER,
    "identifier" TEXT NOT NULL,
    CONSTRAINT "locations_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "regions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "machines" (
    "machine_number" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "move_id" INTEGER NOT NULL,

    PRIMARY KEY ("machine_number", "version_group_id"),
    CONSTRAINT "machines_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "machines_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "machines_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_battle_style_prose" (
    "move_battle_style_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("move_battle_style_id", "local_language_id"),
    CONSTRAINT "move_battle_style_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_battle_style_prose_move_battle_style_id_fkey" FOREIGN KEY ("move_battle_style_id") REFERENCES "move_battle_styles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_battle_styles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "move_changelog" (
    "move_id" INTEGER NOT NULL,
    "changed_in_version_group_id" INTEGER NOT NULL,
    "type_id" INTEGER,
    "power" smallint,
    "pp" smallint,
    "accuracy" smallint,
    "priority" smallint,
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

-- CreateTable
CREATE TABLE "move_damage_class_prose" (
    "move_damage_class_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("move_damage_class_id", "local_language_id"),
    CONSTRAINT "move_damage_class_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_damage_class_prose_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "move_damage_classes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_damage_classes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "move_effect_changelog" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect_id" INTEGER NOT NULL,
    "changed_in_version_group_id" INTEGER NOT NULL,
    CONSTRAINT "move_effect_changelog_changed_in_version_group_id_fkey" FOREIGN KEY ("changed_in_version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_effect_changelog_effect_id_fkey" FOREIGN KEY ("effect_id") REFERENCES "move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_effect_changelog_prose" (
    "move_effect_changelog_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "effect" TEXT NOT NULL,

    PRIMARY KEY ("move_effect_changelog_id", "local_language_id"),
    CONSTRAINT "move_effect_changelog_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_effect_changelog_prose_move_effect_changelog_id_fkey" FOREIGN KEY ("move_effect_changelog_id") REFERENCES "move_effect_changelog" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_effect_prose" (
    "move_effect_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "short_effect" TEXT,
    "effect" TEXT,

    PRIMARY KEY ("move_effect_id", "local_language_id"),
    CONSTRAINT "move_effect_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_effect_prose_move_effect_id_fkey" FOREIGN KEY ("move_effect_id") REFERENCES "move_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "move_flag_map" (
    "move_id" INTEGER NOT NULL,
    "move_flag_id" INTEGER NOT NULL,

    PRIMARY KEY ("move_id", "move_flag_id"),
    CONSTRAINT "move_flag_map_move_flag_id_fkey" FOREIGN KEY ("move_flag_id") REFERENCES "move_flags" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_flag_map_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_flag_prose" (
    "move_flag_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("move_flag_id", "local_language_id"),
    CONSTRAINT "move_flag_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_flag_prose_move_flag_id_fkey" FOREIGN KEY ("move_flag_id") REFERENCES "move_flags" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_flags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "move_flavor_summaries" (
    "move_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "flavor_summary" TEXT,

    PRIMARY KEY ("move_id", "local_language_id"),
    CONSTRAINT "move_flavor_summaries_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_flavor_summaries_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_flavor_text" (
    "move_id" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "flavor_text" TEXT NOT NULL,

    PRIMARY KEY ("move_id", "version_group_id", "language_id"),
    CONSTRAINT "move_flavor_text_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_flavor_text_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_flavor_text_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_meta" (
    "move_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "meta_category_id" INTEGER NOT NULL,
    "meta_ailment_id" INTEGER NOT NULL,
    "min_hits" INTEGER,
    "max_hits" INTEGER,
    "min_turns" INTEGER,
    "max_turns" INTEGER,
    "drain" INTEGER NOT NULL,
    "healing" INTEGER NOT NULL,
    "crit_rate" INTEGER NOT NULL,
    "ailment_chance" INTEGER NOT NULL,
    "flinch_chance" INTEGER NOT NULL,
    "stat_chance" INTEGER NOT NULL,
    CONSTRAINT "move_meta_meta_ailment_id_fkey" FOREIGN KEY ("meta_ailment_id") REFERENCES "move_meta_ailments" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_meta_meta_category_id_fkey" FOREIGN KEY ("meta_category_id") REFERENCES "move_meta_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_meta_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_meta_ailment_names" (
    "move_meta_ailment_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("move_meta_ailment_id", "local_language_id"),
    CONSTRAINT "move_meta_ailment_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_meta_ailment_names_move_meta_ailment_id_fkey" FOREIGN KEY ("move_meta_ailment_id") REFERENCES "move_meta_ailments" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_meta_ailments" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "move_meta_categories" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "move_meta_category_prose" (
    "move_meta_category_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("move_meta_category_id", "local_language_id"),
    CONSTRAINT "move_meta_category_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_meta_category_prose_move_meta_category_id_fkey" FOREIGN KEY ("move_meta_category_id") REFERENCES "move_meta_categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_meta_stat_changes" (
    "move_id" INTEGER NOT NULL,
    "stat_id" INTEGER NOT NULL,
    "change" INTEGER NOT NULL,

    PRIMARY KEY ("move_id", "stat_id"),
    CONSTRAINT "move_meta_stat_changes_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_meta_stat_changes_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_names" (
    "move_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("move_id", "local_language_id"),
    CONSTRAINT "move_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_names_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_target_prose" (
    "move_target_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("move_target_id", "local_language_id"),
    CONSTRAINT "move_target_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "move_target_prose_move_target_id_fkey" FOREIGN KEY ("move_target_id") REFERENCES "move_targets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "move_targets" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "moves" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "power" smallint,
    "pp" smallint,
    "accuracy" smallint,
    "priority" smallint NOT NULL,
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

-- CreateTable
CREATE TABLE "nature_battle_style_preferences" (
    "nature_id" INTEGER NOT NULL,
    "move_battle_style_id" INTEGER NOT NULL,
    "low_hp_preference" INTEGER NOT NULL,
    "high_hp_preference" INTEGER NOT NULL,

    PRIMARY KEY ("nature_id", "move_battle_style_id"),
    CONSTRAINT "nature_battle_style_preferences_move_battle_style_id_fkey" FOREIGN KEY ("move_battle_style_id") REFERENCES "move_battle_styles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "nature_battle_style_preferences_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "natures" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "nature_names" (
    "nature_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("nature_id", "local_language_id"),
    CONSTRAINT "nature_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "nature_names_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "natures" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "nature_pokeathlon_stats" (
    "nature_id" INTEGER NOT NULL,
    "pokeathlon_stat_id" INTEGER NOT NULL,
    "max_change" INTEGER NOT NULL,

    PRIMARY KEY ("nature_id", "pokeathlon_stat_id"),
    CONSTRAINT "nature_pokeathlon_stats_pokeathlon_stat_id_fkey" FOREIGN KEY ("pokeathlon_stat_id") REFERENCES "pokeathlon_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "nature_pokeathlon_stats_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "natures" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "natures" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "decreased_stat_id" INTEGER NOT NULL,
    "increased_stat_id" INTEGER NOT NULL,
    "hates_flavor_id" INTEGER NOT NULL,
    "likes_flavor_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,
    CONSTRAINT "natures_likes_flavor_id_fkey" FOREIGN KEY ("likes_flavor_id") REFERENCES "contest_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "natures_hates_flavor_id_fkey" FOREIGN KEY ("hates_flavor_id") REFERENCES "contest_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "natures_increased_stat_id_fkey" FOREIGN KEY ("increased_stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "natures_decreased_stat_id_fkey" FOREIGN KEY ("decreased_stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pal_park" (
    "species_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "area_id" INTEGER NOT NULL,
    "base_score" INTEGER NOT NULL,
    "rate" INTEGER NOT NULL,
    CONSTRAINT "pal_park_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "pal_park_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pal_park_species_id_fkey" FOREIGN KEY ("species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pal_park_area_names" (
    "pal_park_area_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("pal_park_area_id", "local_language_id"),
    CONSTRAINT "pal_park_area_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pal_park_area_names_pal_park_area_id_fkey" FOREIGN KEY ("pal_park_area_id") REFERENCES "pal_park_areas" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pal_park_areas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokeathlon_stat_names" (
    "pokeathlon_stat_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("pokeathlon_stat_id", "local_language_id"),
    CONSTRAINT "pokeathlon_stat_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokeathlon_stat_names_pokeathlon_stat_id_fkey" FOREIGN KEY ("pokeathlon_stat_id") REFERENCES "pokeathlon_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokeathlon_stats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokedex_prose" (
    "pokedex_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("pokedex_id", "local_language_id"),
    CONSTRAINT "pokedex_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokedex_prose_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokedexes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokedex_version_groups" (
    "pokedex_id" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,

    PRIMARY KEY ("pokedex_id", "version_group_id"),
    CONSTRAINT "pokedex_version_groups_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokedex_version_groups_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokedexes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokedexes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "region_id" INTEGER,
    "identifier" TEXT NOT NULL,
    "is_main_series" BOOLEAN NOT NULL,
    CONSTRAINT "pokedexes_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "regions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "species_id" INTEGER,
    "height" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "base_experience" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "is_default" BOOLEAN NOT NULL,
    CONSTRAINT "pokemon_species_id_fkey" FOREIGN KEY ("species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_abilities" (
    "pokemon_id" INTEGER NOT NULL,
    "ability_id" INTEGER NOT NULL,
    "is_hidden" BOOLEAN NOT NULL,
    "slot" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_id", "slot"),
    CONSTRAINT "pokemon_abilities_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "abilities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_abilities_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_color_names" (
    "pokemon_color_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("pokemon_color_id", "local_language_id"),
    CONSTRAINT "pokemon_color_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_color_names_pokemon_color_id_fkey" FOREIGN KEY ("pokemon_color_id") REFERENCES "pokemon_colors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_colors" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_dex_numbers" (
    "species_id" INTEGER NOT NULL,
    "pokedex_id" INTEGER NOT NULL,
    "pokedex_number" INTEGER NOT NULL,

    PRIMARY KEY ("species_id", "pokedex_id"),
    CONSTRAINT "pokemon_dex_numbers_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokedexes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_dex_numbers_species_id_fkey" FOREIGN KEY ("species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_egg_groups" (
    "species_id" INTEGER NOT NULL,
    "egg_group_id" INTEGER NOT NULL,

    PRIMARY KEY ("species_id", "egg_group_id"),
    CONSTRAINT "pokemon_egg_groups_egg_group_id_fkey" FOREIGN KEY ("egg_group_id") REFERENCES "egg_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_egg_groups_species_id_fkey" FOREIGN KEY ("species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_evolution" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "evolved_species_id" INTEGER NOT NULL,
    "evolution_trigger_id" INTEGER NOT NULL,
    "trigger_item_id" INTEGER,
    "minimum_level" INTEGER,
    "gender_id" INTEGER,
    "location_id" INTEGER,
    "held_item_id" INTEGER,
    "time_of_day" TEXT,
    "known_move_id" INTEGER,
    "known_move_type_id" INTEGER,
    "minimum_happiness" INTEGER,
    "minimum_beauty" INTEGER,
    "minimum_affection" INTEGER,
    "relative_physical_stats" INTEGER,
    "party_species_id" INTEGER,
    "party_type_id" INTEGER,
    "trade_species_id" INTEGER,
    "needs_overworld_rain" BOOLEAN NOT NULL,
    "turn_upside_down" BOOLEAN NOT NULL,
    CONSTRAINT "pokemon_evolution_trade_species_id_fkey" FOREIGN KEY ("trade_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_party_type_id_fkey" FOREIGN KEY ("party_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_party_species_id_fkey" FOREIGN KEY ("party_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_known_move_type_id_fkey" FOREIGN KEY ("known_move_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_known_move_id_fkey" FOREIGN KEY ("known_move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_held_item_id_fkey" FOREIGN KEY ("held_item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_trigger_item_id_fkey" FOREIGN KEY ("trigger_item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_evolution_trigger_id_fkey" FOREIGN KEY ("evolution_trigger_id") REFERENCES "evolution_triggers" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_evolution_evolved_species_id_fkey" FOREIGN KEY ("evolved_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_form_generations" (
    "pokemon_form_id" INTEGER NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_form_id", "generation_id"),
    CONSTRAINT "pokemon_form_generations_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_form_generations_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_forms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_form_names" (
    "pokemon_form_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "form_name" TEXT,
    "pokemon_name" TEXT,

    PRIMARY KEY ("pokemon_form_id", "local_language_id"),
    CONSTRAINT "pokemon_form_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_form_names_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_forms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_form_pokeathlon_stats" (
    "pokemon_form_id" INTEGER NOT NULL,
    "pokeathlon_stat_id" INTEGER NOT NULL,
    "minimum_stat" INTEGER NOT NULL,
    "base_stat" INTEGER NOT NULL,
    "maximum_stat" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_form_id", "pokeathlon_stat_id"),
    CONSTRAINT "pokemon_form_pokeathlon_stats_pokeathlon_stat_id_fkey" FOREIGN KEY ("pokeathlon_stat_id") REFERENCES "pokeathlon_stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_form_pokeathlon_stats_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_forms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_forms" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "form_identifier" TEXT,
    "pokemon_id" INTEGER NOT NULL,
    "introduced_in_version_group_id" INTEGER,
    "is_default" BOOLEAN NOT NULL,
    "is_battle_only" BOOLEAN NOT NULL,
    "is_mega" BOOLEAN NOT NULL,
    "form_order" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    CONSTRAINT "pokemon_forms_introduced_in_version_group_id_fkey" FOREIGN KEY ("introduced_in_version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_forms_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_game_indices" (
    "pokemon_id" INTEGER NOT NULL,
    "version_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_id", "version_id"),
    CONSTRAINT "pokemon_game_indices_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_game_indices_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_habitat_names" (
    "pokemon_habitat_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("pokemon_habitat_id", "local_language_id"),
    CONSTRAINT "pokemon_habitat_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_habitat_names_pokemon_habitat_id_fkey" FOREIGN KEY ("pokemon_habitat_id") REFERENCES "pokemon_habitats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_habitats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_items" (
    "pokemon_id" INTEGER NOT NULL,
    "version_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "rarity" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_id", "version_id", "item_id"),
    CONSTRAINT "pokemon_items_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_items_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_items_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_move_method_prose" (
    "pokemon_move_method_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("pokemon_move_method_id", "local_language_id"),
    CONSTRAINT "pokemon_move_method_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_move_method_prose_pokemon_move_method_id_fkey" FOREIGN KEY ("pokemon_move_method_id") REFERENCES "pokemon_move_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_move_methods" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_moves" (
    "pokemon_id" INTEGER NOT NULL,
    "version_group_id" INTEGER NOT NULL,
    "move_id" INTEGER NOT NULL,
    "pokemon_move_method_id" INTEGER NOT NULL,
    "level" INTEGER NOT NULL,
    "order" INTEGER,

    PRIMARY KEY ("pokemon_id", "version_group_id", "move_id", "pokemon_move_method_id", "level"),
    CONSTRAINT "pokemon_moves_pokemon_move_method_id_fkey" FOREIGN KEY ("pokemon_move_method_id") REFERENCES "pokemon_move_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_moves_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_moves_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_moves_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_shape_prose" (
    "pokemon_shape_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "awesome_name" TEXT,
    "description" TEXT,

    PRIMARY KEY ("pokemon_shape_id", "local_language_id"),
    CONSTRAINT "pokemon_shape_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_shape_prose_pokemon_shape_id_fkey" FOREIGN KEY ("pokemon_shape_id") REFERENCES "pokemon_shapes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_shapes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_species" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER,
    "evolves_from_species_id" INTEGER,
    "evolution_chain_id" INTEGER,
    "color_id" INTEGER NOT NULL,
    "shape_id" INTEGER NOT NULL,
    "habitat_id" INTEGER,
    "gender_rate" INTEGER NOT NULL,
    "capture_rate" INTEGER NOT NULL,
    "base_happiness" INTEGER NOT NULL,
    "is_baby" BOOLEAN NOT NULL,
    "hatch_counter" INTEGER NOT NULL,
    "has_gender_differences" BOOLEAN NOT NULL,
    "growth_rate_id" INTEGER NOT NULL,
    "forms_switchable" BOOLEAN NOT NULL,
    "order" INTEGER NOT NULL,
    "conquest_order" INTEGER,
    CONSTRAINT "pokemon_species_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "growth_rates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_habitat_id_fkey" FOREIGN KEY ("habitat_id") REFERENCES "pokemon_habitats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_shape_id_fkey" FOREIGN KEY ("shape_id") REFERENCES "pokemon_shapes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_color_id_fkey" FOREIGN KEY ("color_id") REFERENCES "pokemon_colors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_evolution_chain_id_fkey" FOREIGN KEY ("evolution_chain_id") REFERENCES "evolution_chains" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_evolves_from_species_id_fkey" FOREIGN KEY ("evolves_from_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_species_flavor_summaries" (
    "pokemon_species_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "flavor_summary" TEXT,

    PRIMARY KEY ("pokemon_species_id", "local_language_id"),
    CONSTRAINT "pokemon_species_flavor_summaries_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_flavor_summaries_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_species_flavor_text" (
    "species_id" INTEGER NOT NULL,
    "version_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "flavor_text" TEXT NOT NULL,

    PRIMARY KEY ("species_id", "version_id", "language_id"),
    CONSTRAINT "pokemon_species_flavor_text_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_flavor_text_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_flavor_text_species_id_fkey" FOREIGN KEY ("species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_species_names" (
    "pokemon_species_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT,
    "genus" TEXT,

    PRIMARY KEY ("pokemon_species_id", "local_language_id"),
    CONSTRAINT "pokemon_species_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_names_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_species_prose" (
    "pokemon_species_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "form_description" TEXT,

    PRIMARY KEY ("pokemon_species_id", "local_language_id"),
    CONSTRAINT "pokemon_species_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_species_prose_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_species" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_stats" (
    "pokemon_id" INTEGER NOT NULL,
    "stat_id" INTEGER NOT NULL,
    "base_stat" INTEGER NOT NULL,
    "effort" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_id", "stat_id"),
    CONSTRAINT "pokemon_stats_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_stats_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_types" (
    "pokemon_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "slot" INTEGER NOT NULL,

    PRIMARY KEY ("pokemon_id", "slot"),
    CONSTRAINT "pokemon_types_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_types_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "region_names" (
    "region_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("region_id", "local_language_id"),
    CONSTRAINT "region_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "region_names_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "regions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "regions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "stat_names" (
    "stat_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("stat_id", "local_language_id"),
    CONSTRAINT "stat_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "stat_names_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "stats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "stats" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "damage_class_id" INTEGER,
    "identifier" TEXT NOT NULL,
    "is_battle_only" BOOLEAN NOT NULL,
    "game_index" INTEGER,
    CONSTRAINT "stats_damage_class_id_fkey" FOREIGN KEY ("damage_class_id") REFERENCES "move_damage_classes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "super_contest_combos" (
    "first_move_id" INTEGER NOT NULL,
    "second_move_id" INTEGER NOT NULL,

    PRIMARY KEY ("first_move_id", "second_move_id"),
    CONSTRAINT "super_contest_combos_second_move_id_fkey" FOREIGN KEY ("second_move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "super_contest_combos_first_move_id_fkey" FOREIGN KEY ("first_move_id") REFERENCES "moves" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "super_contest_effect_prose" (
    "super_contest_effect_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "flavor_text" TEXT NOT NULL,

    PRIMARY KEY ("super_contest_effect_id", "local_language_id"),
    CONSTRAINT "super_contest_effect_prose_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "super_contest_effect_prose_super_contest_effect_id_fkey" FOREIGN KEY ("super_contest_effect_id") REFERENCES "super_contest_effects" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "super_contest_effects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" smallint NOT NULL
);

-- CreateTable
CREATE TABLE "type_efficacy" (
    "damage_type_id" INTEGER NOT NULL,
    "target_type_id" INTEGER NOT NULL,
    "damage_factor" INTEGER NOT NULL,

    PRIMARY KEY ("damage_type_id", "target_type_id"),
    CONSTRAINT "type_efficacy_target_type_id_fkey" FOREIGN KEY ("target_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "type_efficacy_damage_type_id_fkey" FOREIGN KEY ("damage_type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "type_game_indices" (
    "type_id" INTEGER NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "game_index" INTEGER NOT NULL,

    PRIMARY KEY ("type_id", "generation_id"),
    CONSTRAINT "type_game_indices_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "type_game_indices_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "type_names" (
    "type_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("type_id", "local_language_id"),
    CONSTRAINT "type_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "type_names_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "types" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "damage_class_id" INTEGER,
    CONSTRAINT "types_damage_class_id_fkey" FOREIGN KEY ("damage_class_id") REFERENCES "move_damage_classes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "types_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "version_group_pokemon_move_methods" (
    "version_group_id" INTEGER NOT NULL,
    "pokemon_move_method_id" INTEGER NOT NULL,

    PRIMARY KEY ("version_group_id", "pokemon_move_method_id"),
    CONSTRAINT "version_group_pokemon_move_methods_pokemon_move_method_id_fkey" FOREIGN KEY ("pokemon_move_method_id") REFERENCES "pokemon_move_methods" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "version_group_pokemon_move_methods_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "version_group_regions" (
    "version_group_id" INTEGER NOT NULL,
    "region_id" INTEGER NOT NULL,

    PRIMARY KEY ("version_group_id", "region_id"),
    CONSTRAINT "version_group_regions_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "regions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "version_group_regions_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "version_groups" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "identifier" TEXT NOT NULL,
    "generation_id" INTEGER NOT NULL,
    "order" INTEGER,
    CONSTRAINT "version_groups_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "generations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "version_names" (
    "version_id" INTEGER NOT NULL,
    "local_language_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("version_id", "local_language_id"),
    CONSTRAINT "version_names_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "version_names_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "versions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "versions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "version_group_id" INTEGER NOT NULL,
    "identifier" TEXT NOT NULL,
    CONSTRAINT "versions_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "version_groups" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateIndex
CREATE INDEX "ix_abilities_is_main_series" ON "abilities"("is_main_series");

-- CreateIndex
CREATE INDEX "ix_ability_names_name" ON "ability_names"("name");

-- CreateIndex
CREATE INDEX "ix_berry_firmness_names_name" ON "berry_firmness_names"("name");

-- CreateIndex
CREATE INDEX "ix_characteristic_text_message" ON "characteristic_text"("message");

-- CreateIndex
CREATE INDEX "ix_characteristics_gene_mod_5" ON "characteristics"("gene_mod_5");

-- CreateIndex
CREATE INDEX "ix_conquest_episode_names_name" ON "conquest_episode_names"("name");

-- CreateIndex
CREATE INDEX "ix_conquest_kingdom_names_name" ON "conquest_kingdom_names"("name");

-- CreateIndex
CREATE INDEX "ix_conquest_stat_names_name" ON "conquest_stat_names"("name");

-- CreateIndex
CREATE INDEX "ix_conquest_warrior_names_name" ON "conquest_warrior_names"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_conquest_warrior_ranks_1" ON "conquest_warrior_ranks"("warrior_id", "rank");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "ix_conquest_warrior_skill_names_name" ON "conquest_warrior_skill_names"("name");

-- CreateIndex
CREATE INDEX "ix_conquest_warrior_stat_names_name" ON "conquest_warrior_stat_names"("name");

-- CreateIndex
CREATE INDEX "ix_contest_type_names_name" ON "contest_type_names"("name");

-- CreateIndex
CREATE INDEX "ix_egg_group_prose_name" ON "egg_group_prose"("name");

-- CreateIndex
CREATE INDEX "ix_encounter_condition_prose_name" ON "encounter_condition_prose"("name");

-- CreateIndex
CREATE INDEX "ix_encounter_condition_value_prose_name" ON "encounter_condition_value_prose"("name");

-- CreateIndex
CREATE INDEX "ix_encounter_method_prose_name" ON "encounter_method_prose"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_encounter_methods_1" ON "encounter_methods"("identifier");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_encounter_methods_2" ON "encounter_methods"("order");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "ix_evolution_trigger_prose_name" ON "evolution_trigger_prose"("name");

-- CreateIndex
CREATE INDEX "ix_generation_names_name" ON "generation_names"("name");

-- CreateIndex
CREATE INDEX "ix_growth_rate_prose_name" ON "growth_rate_prose"("name");

-- CreateIndex
CREATE INDEX "ix_item_category_prose_name" ON "item_category_prose"("name");

-- CreateIndex
CREATE INDEX "ix_item_flag_prose_name" ON "item_flag_prose"("name");

-- CreateIndex
CREATE INDEX "ix_item_names_name" ON "item_names"("name");

-- CreateIndex
CREATE INDEX "ix_item_pocket_names_name" ON "item_pocket_names"("name");

-- CreateIndex
CREATE INDEX "ix_language_names_name" ON "language_names"("name");

-- CreateIndex
CREATE INDEX "ix_languages_official" ON "languages"("official");

-- CreateIndex
CREATE INDEX "ix_location_area_prose_name" ON "location_area_prose"("name");

-- CreateIndex
CREATE INDEX "ix_location_names_name" ON "location_names"("name");

-- CreateIndex
CREATE INDEX "ix_move_battle_style_prose_name" ON "move_battle_style_prose"("name");

-- CreateIndex
CREATE INDEX "ix_move_damage_class_prose_name" ON "move_damage_class_prose"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_move_effect_changelog_1" ON "move_effect_changelog"("effect_id", "changed_in_version_group_id");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "ix_move_flag_prose_name" ON "move_flag_prose"("name");

-- CreateIndex
CREATE INDEX "ix_move_meta_stat_chance" ON "move_meta"("stat_chance");

-- CreateIndex
CREATE INDEX "ix_move_meta_crit_rate" ON "move_meta"("crit_rate");

-- CreateIndex
CREATE INDEX "ix_move_meta_min_hits" ON "move_meta"("min_hits");

-- CreateIndex
CREATE INDEX "ix_move_meta_max_turns" ON "move_meta"("max_turns");

-- CreateIndex
CREATE INDEX "ix_move_meta_ailment_chance" ON "move_meta"("ailment_chance");

-- CreateIndex
CREATE INDEX "ix_move_meta_drain" ON "move_meta"("drain");

-- CreateIndex
CREATE INDEX "ix_move_meta_max_hits" ON "move_meta"("max_hits");

-- CreateIndex
CREATE INDEX "ix_move_meta_flinch_chance" ON "move_meta"("flinch_chance");

-- CreateIndex
CREATE INDEX "ix_move_meta_healing" ON "move_meta"("healing");

-- CreateIndex
CREATE INDEX "ix_move_meta_min_turns" ON "move_meta"("min_turns");

-- CreateIndex
CREATE INDEX "ix_move_meta_ailment_names_name" ON "move_meta_ailment_names"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ix_move_meta_ailments_identifier" ON "move_meta_ailments"("identifier");

-- CreateIndex
CREATE UNIQUE INDEX "ix_move_meta_categories_identifier" ON "move_meta_categories"("identifier");

-- CreateIndex
CREATE INDEX "ix_move_meta_stat_changes_change" ON "move_meta_stat_changes"("change");

-- CreateIndex
CREATE INDEX "ix_move_names_name" ON "move_names"("name");

-- CreateIndex
CREATE INDEX "ix_move_target_prose_name" ON "move_target_prose"("name");

-- CreateIndex
CREATE INDEX "ix_nature_names_name" ON "nature_names"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_natures_1" ON "natures"("game_index");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "ix_pal_park_area_names_name" ON "pal_park_area_names"("name");

-- CreateIndex
CREATE INDEX "ix_pokeathlon_stat_names_name" ON "pokeathlon_stat_names"("name");

-- CreateIndex
CREATE INDEX "ix_pokedex_prose_name" ON "pokedex_prose"("name");

-- CreateIndex
CREATE INDEX "ix_pokemon_is_default" ON "pokemon"("is_default");

-- CreateIndex
CREATE INDEX "ix_pokemon_order" ON "pokemon"("order");

-- CreateIndex
CREATE INDEX "ix_pokemon_abilities_is_hidden" ON "pokemon_abilities"("is_hidden");

-- CreateIndex
CREATE INDEX "ix_pokemon_color_names_name" ON "pokemon_color_names"("name");

-- CreateIndex
CREATE INDEX "ix_pokemon_form_names_form_name" ON "pokemon_form_names"("form_name");

-- CreateIndex
CREATE INDEX "ix_pokemon_form_names_pokemon_name" ON "pokemon_form_names"("pokemon_name");

-- CreateIndex
CREATE INDEX "ix_pokemon_habitat_names_name" ON "pokemon_habitat_names"("name");

-- CreateIndex
CREATE INDEX "ix_pokemon_move_method_prose_name" ON "pokemon_move_method_prose"("name");

-- CreateIndex
CREATE INDEX "ix_pokemon_moves_level" ON "pokemon_moves"("level");

-- CreateIndex
CREATE INDEX "ix_pokemon_moves_move_id" ON "pokemon_moves"("move_id");

-- CreateIndex
CREATE INDEX "ix_pokemon_moves_pokemon_id" ON "pokemon_moves"("pokemon_id");

-- CreateIndex
CREATE INDEX "ix_pokemon_moves_pokemon_move_method_id" ON "pokemon_moves"("pokemon_move_method_id");

-- CreateIndex
CREATE INDEX "ix_pokemon_moves_version_group_id" ON "pokemon_moves"("version_group_id");

-- CreateIndex
CREATE INDEX "ix_pokemon_shape_prose_name" ON "pokemon_shape_prose"("name");

-- CreateIndex
CREATE INDEX "ix_pokemon_species_conquest_order" ON "pokemon_species"("conquest_order");

-- CreateIndex
CREATE INDEX "ix_pokemon_species_order" ON "pokemon_species"("order");

-- CreateIndex
CREATE INDEX "ix_pokemon_species_names_name" ON "pokemon_species_names"("name");

-- CreateIndex
CREATE INDEX "ix_region_names_name" ON "region_names"("name");

-- CreateIndex
CREATE INDEX "ix_stat_names_name" ON "stat_names"("name");

-- CreateIndex
CREATE INDEX "ix_type_names_name" ON "type_names"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_version_groups_1" ON "version_groups"("identifier");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "ix_version_names_name" ON "version_names"("name");

