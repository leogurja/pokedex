import { ENDPOINTS } from "../constants";
import type { Generation, Pokedex, Version, VersionGroup } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Game Client
 *
 * Client used to access the Game Endpoints:
 *  - [Generations](https://pokeapi.co/docs/v2#generations)
 *  - [Pokedexes](https://pokeapi.co/docs/v2#pokedexes)
 *  - [Versions](https://pokeapi.co/docs/v2#version)
 *  - [Version Groups](https://pokeapi.co/docs/v2#version-groups)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#games-section)
 */

/**
 * Get a Generation by it's ID or name
 * @param id The generation ID or name
 * @returns A Generation
 */
export async function getGeneration(id: number | string) {
	return getResource<Generation>(ENDPOINTS.GENERATION, id);
}

/**
 * Get a Pokedex by it's ID or name
 * @param id The pokedex ID or name
 * @returns A Pokedex
 */
export async function getPokedex(id: number | string) {
	return getResource<Pokedex>(ENDPOINTS.POKEDEX, id);
}

/**
 * Get a Version by it's ID or name
 * @param id The version ID or name
 * @returns A Version
 */
export async function getVersion(id: number | string) {
	return getResource<Version>(ENDPOINTS.VERSION, id);
}

/**
 * Get a Version Group by it's ID or name
 * @param id The version group ID or name
 * @returns A Version Group
 */
export async function getVersionGroup(id: number | string) {
	return getResource<VersionGroup>(ENDPOINTS.VERSION_GROUP, id);
}

/**
 * List Generations
 * @param offset The first item that you will get
 * @param limit How many Generations per page
 * @returns A list of Generations
 */
export async function listGenerations(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.GENERATION, offset, limit);
}

/**
 * List Pokedexes
 * @param offset The first item that you will get
 * @param limit How many Pokedexes per page
 * @returns A list of Pokedexes
 */
export async function listPokedexes(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.POKEDEX, offset, limit);
}

/**
 * List Versions
 * @param offset The first item that you will get
 * @param limit How many Versions per page
 * @returns A list of Versions
 */
export async function listVersions(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.VERSION, offset, limit);
}

/**
 * List Version Groups
 * @param offset The first item that you will get
 * @param limit How many Version Groups per page
 * @returns A list of Version Groups
 */
export async function listVersionGroups(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.VERSION_GROUP, offset, limit);
}
