import { ENDPOINTS } from "../constants";
import type {
	Ability,
	Characteristic,
	EggGroup,
	Gender,
	GrowthRate,
	LocationAreaEncounter,
	Nature,
	PokeathlonStat,
	Pokemon,
	PokemonColor,
	PokemonForm,
	PokemonHabitat,
	PokemonShape,
	PokemonSpecies,
	Stat,
	Type,
} from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Pokemon Client
 *
 * Client used to access the Pokemon Endpoints:
 *  - [Abilities](https://pokeapi.co/docs/v2#abilities)
 *  - [Characteristics](https://pokeapi.co/docs/v2#characteristics)
 *  - [Egg Groups](https://pokeapi.co/docs/v2#egg-groups)
 *  - [Genders](https://pokeapi.co/docs/v2#genders)
 *  - [Growth Rates](https://pokeapi.co/docs/v2#growth-rates)
 *  - [Natures](https://pokeapi.co/docs/v2#natures)
 *  - [Pokeathlon Stats](https://pokeapi.co/docs/v2#pokeathlon-stats)
 *  - [Pokemon](https://pokeapi.co/docs/v2#pokemon)
 *  - [Pokemon Location Areas](https://pokeapi.co/docs/v2#pokemon-location-areas)
 *  - [Pokemon Colors](https://pokeapi.co/docs/v2#pokemon-colors)
 *  - [Pokemon Forms](https://pokeapi.co/docs/v2#pokemon-forms)
 *  - [Pokemon Habitats](https://pokeapi.co/docs/v2#pokemon-habitats)
 *  - [Pokemon Shapes](https://pokeapi.co/docs/v2#pokemon-shapes)
 *  - [Pokemon Species](https://pokeapi.co/docs/v2#pokemon-species)
 *  - [Stats](https://pokeapi.co/docs/v2#stats)
 *  - [Types](https://pokeapi.co/docs/v2#types)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#pokemon-section)
 */

/**
 * Get an Ability by it's ID or name
 * @param id The Ability ID or name
 * @returns An Ability
 */
export async function getAbility(id: number | string) {
	return getResource<Ability>(ENDPOINTS.ABILITY, id);
}

/**
 * Get a Characteristic by it's ID or name
 * @param id The Characteristic ID or name
 * @returns A Characteristic
 */
export async function getCharacteristic(id: number | string) {
	return getResource<Characteristic>(ENDPOINTS.CHARACTERISTIC, id);
}

/**
 * Get an Egg Group by it's ID or name
 * @param id The Egg Group ID or name
 * @returns An Egg Group
 */
export async function getEggGroup(id: number | string) {
	return getResource<EggGroup>(ENDPOINTS.EGG_GROUP, id);
}

/**
 * Get a Gender by it's ID
 * @param id The Gender ID
 * @returns A Gender
 */
export async function getGender(id: number) {
	return getResource<Gender>(ENDPOINTS.GENDER, id);
}

/**
 * Get a Growth Rate by it's ID or name
 * @param name The Growth Rate ID or name
 * @returns A Growth Rate
 */
export async function getGrowthRate(id: number | string) {
	return getResource<GrowthRate>(ENDPOINTS.GROWTH_RATE, id);
}

/**
 * Get a Nature by it's ID or name
 * @param name The Nature ID or name
 * @returns A Nature
 */
export async function getNature(id: number | string) {
	return getResource<Nature>(ENDPOINTS.NATURE, id);
}

/**
 * Get a Pokeathlon Stat by it's ID or name
 * @param id The Pokeathlon Stat ID or name
 * @returns A Pokeathlon Stat
 */
export async function getPokeathlonStat(id: number | string) {
	return getResource<PokeathlonStat>(ENDPOINTS.POKEATHLON_STAT, id);
}

/**
 * Get a Pokemon by it's ID or name
 * @param id The Pokemon ID or name
 * @returns A Pokemon
 */
export async function getPokemonById(id: number | string) {
	return getResource<Pokemon>(ENDPOINTS.POKEMON, id);
}

/**
 * Get a Pokemon Location Area by it's ID
 * @param id The Pokemon Location Area ID
 * @returns A Pokemon Location Area
 */
export async function getPokemonLocationArea(id: number) {
	return getResource<LocationAreaEncounter[]>(
		ENDPOINTS.POKEMON_LOCATION_AREA.replace(":id", id.toString()),
	);
}

/**
 * Get a Pokemon Color by it's ID or name
 * @param id The Pokemon Color ID or name
 * @returns A Pokemon Color
 */
export async function getPokemonColor(id: number | string) {
	return getResource<PokemonColor>(ENDPOINTS.POKEMON_COLOR, id);
}

/**
 * Get a Pokemon Form by it's ID or name
 * @param id The Pokemon Form ID or name
 * @returns A Pokemon Form
 */
export async function getPokemonForm(id: number | string) {
	return getResource<PokemonForm>(ENDPOINTS.POKEMON_FORM, id);
}

/**
 * Get a Pokemon Habitat by it's ID or name
 * @param id The Pokemon Habitat Form ID or name
 * @returns A Pokemon Habitat
 */
export async function getPokemonHabitat(id: number | string) {
	return getResource<PokemonHabitat>(ENDPOINTS.POKEMON_HABITAT, id);
}

/**
 * Get a Pokemon Shape by it's ID or name
 * @param id The Pokemon Shape Form ID or name
 * @returns A Pokemon Shape
 */
export async function getPokemonShape(id: number | string) {
	return getResource<PokemonShape>(ENDPOINTS.POKEMON_SHAPE, id);
}

/**
 * Get a Pokemon Species by it's ID or name
 * @param id The Pokemon Species Form ID or name
 * @returns A Pokemon Species
 */
export async function getPokemonSpecies(id: number | string) {
	return getResource<PokemonSpecies>(ENDPOINTS.POKEMON_SPECIES, id);
}

/**
 * Get a Stat by it's ID or name
 * @param id The Stat ID or name
 * @returns A Stat
 */
export async function getStat(id: number | string) {
	return getResource<Stat>(ENDPOINTS.STAT, id);
}

/**
 * Get a Type by it's ID or name
 * @param id The Type ID or name
 * @returns A Type
 */
export async function getType(id: number | string) {
	return getResource<Type>(ENDPOINTS.TYPE, id);
}

/**
 * List Abilities
 * @param offset The first item that you will get
 * @param limit How many Abilities per page
 * @returns A list of Abilities
 */
export async function listAbilities(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ABILITY, offset, limit);
}

/**
 * List Characteristics
 * @param offset The first item that you will get
 * @param limit How many Characteristics per page
 * @returns A list of Characteristics
 */
export async function listCharacteristics(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.CHARACTERISTIC, offset, limit);
}

/**
 * List Egg Groups
 * @param offset The first item that you will get
 * @param limit How many Egg Groups per page
 * @returns A list of Egg Groups
 */
export async function listEggGroups(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.EGG_GROUP, offset, limit);
}

/**
 * List Genders
 * @param offset The first item that you will get
 * @param limit How many Genders per page
 * @returns A list of Genders
 */
export async function listGenders(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.GENDER, offset, limit);
}

/**
 * List Growth Rates
 * @param offset The first item that you will get
 * @param limit How many Growth Rates per page
 * @returns A list of Growth Rates
 */
export async function listGrowthRates(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.GROWTH_RATE, offset, limit);
}

/**
 * List Natures
 * @param offset The first item that you will get
 * @param limit How many Growth Natures per page
 * @returns A list of Natures
 */
export async function listNatures(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.NATURE, offset, limit);
}

/**
 * List Pokeathlon Stats
 * @param offset The first item that you will get
 * @param limit How many Pokeathlon Stats per page
 * @returns A list of Pokeathlon Stats
 */
export async function listPokeathlonStats(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEATHLON_STAT, offset, limit);
}

/**
 * List Pokemons
 * @param offset The first item that you will get
 * @param limit How many Pokemons Stats per page
 * @returns A list of Pokemons
 */
export async function listPokemon(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON, offset, limit);
}

/**
 * List Pokemon Colors
 * @param offset The first item that you will get
 * @param limit How many Pokemon Colors per page
 * @returns A list of Pokemon Colors
 */
export async function listPokemonColors(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON_COLOR, offset, limit);
}

/**
 * List Pokemon Forms
 * @param offset The first item that you will get
 * @param limit How many Pokemon Forms per page
 * @returns A list of Pokemon Forms
 */
export async function listPokemonForms(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON_FORM, offset, limit);
}

/**
 * List Pokemon Habitats
 * @param offset The first item that you will get
 * @param limit How many Pokemon Habitats per page
 * @returns A list of Pokemon Habitats
 */
export async function listPokemonHabitats(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON_HABITAT, offset, limit);
}

/**
 * List Pokemon Shapes
 * @param offset The first item that you will get
 * @param limit How many Pokemon Shapes per page
 * @returns A list of Pokemon Shapes
 */
export async function listPokemonShapes(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON_SHAPE, offset, limit);
}

/**
 * List Pokemon Species
 * @param offset The first item that you will get
 * @param limit How many Pokemon Species per page
 * @returns A list of Pokemon Species
 */
export async function listPokemonSpecies(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEMON_SPECIES, offset, limit);
}

/**
 * List Stats
 * @param offset The first item that you will get
 * @param limit How many Stats per page
 * @returns A list of Stats
 */
export async function listStats(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.STAT, offset, limit);
}

/**
 * List Types
 * @param offset The first item that you will get
 * @param limit How many Types per page
 * @returns A list of Types
 */
export async function listTypes(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.TYPE, offset, limit);
}
