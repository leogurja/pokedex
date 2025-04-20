import { ENDPOINTS } from "../constants";
import type { ContestEffect, ContestType, SuperContestEffect } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Contest Client
 *
 * Client used to access the Contest Endpoints:
 *  - [Contest Types](https://pokeapi.co/docs/v2#contest-types)
 *  - [Contest Effects](https://pokeapi.co/docs/v2#contest-effects)
 *  - [Super Contest Effects](https://pokeapi.co/docs/v2#super-contest-effects)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#contests-section)
 */

/**
 * Get a Contest Type by it's ID or name
 * @param id The Contest Type ID or name
 * @returns A Contest Type
 */
export async function getContestTypeById(id: number | string) {
	return getResource<ContestType>(ENDPOINTS.CONTEST_TYPE, id);
}

/**
 * Get a Contest Effect by it's ID
 * @param id The Contest Effect ID
 * @returns Contest Effect
 */
export async function getContestEffectById(id: number) {
	return getResource<ContestEffect>(ENDPOINTS.CONTEST_EFFECT, id);
}

/**
 * Get a Super Contest Effect by it's ID
 * @param id The Super Contest Effect ID
 * @returns Super Contest Effect
 */
export async function getSuperContestEffectById(id: number) {
	return getResource<SuperContestEffect>(ENDPOINTS.SUPER_CONTEST_EFFECT, id);
}

/**
 * List Contest Types
 * @param offset The first item that you will get
 * @param limit How many contest types per page
 * @returns A list of contest types
 */
export async function listContestTypes(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.CONTEST_TYPE, offset, limit);
}

/**
 * List Contest Effects
 * @param offset The first item that you will get
 * @param limit How many contest effects per page
 * @returns A list of contest effects
 */
export async function listContestEffects(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.CONTEST_EFFECT, offset, limit);
}

/**
 * List Super Contest Effects
 * @param offset The first item that you will get
 * @param limit How many Super Contest Effect per page
 * @returns A list of Super Contest Effect
 */
export async function listSuperContestEffects(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.SUPER_CONTEST_EFFECT, offset, limit);
}
