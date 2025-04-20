import { ENDPOINTS } from "../constants";
import type { Berry, BerryFirmness, BerryFlavor } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Berry Client
 *
 * Client used to access the Berry Endpoints:
 *  - [Berries](https://pokeapi.co/docs/v2#berries)
 *  - [Berry Firmnesses](https://pokeapi.co/docs/v2#berry-firmnesses)
 *  - [Berry Flavors](https://pokeapi.co/docs/v2#berry-flavors)
 *
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#berries-section)
 */

/**
 * Get a Berry by it's ID or name
 * @param id The Berry ID or name
 * @returns A Berry
 */
export async function getBerry(id: number | string) {
	return getResource<Berry>(ENDPOINTS.BERRY, id);
}

/**
 * Get a Berry Firmness by it's ID or name
 * @param id The Berry ID or name
 * @returns Berry Firmness
 */
export async function getBerryFirmness(id: number | string) {
	return getResource<BerryFirmness>(ENDPOINTS.BERRY_FIRMNESS, id);
}

/**
 * Flavors determine whether a Pokémon will benefit or suffer from eating a berry based on their nature.
 * Check out [Bulbapedia](https://bulbapedia.bulbagarden.net/wiki/Flavor) for greater detail.
 * @param id The Berry Flavor ID or name
 * @returns Berry Flavor
 */
export async function getBerryFlavor(id: number | string) {
	return getResource<BerryFlavor>(ENDPOINTS.BERRY_FLAVOR, id);
}

/**
 * List Berries
 * @param offset The first item that you will get
 * @param limit How many berries per page
 * @returns A list of berries
 */
export async function listBerries(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.BERRY, offset, limit);
}

/**
 * List Berries
 * @param offset The first item that you will get
 * @param limit How many berry firmnesses per page
 * @returns A list of berry firmnesses
 */
export async function listBerryFirmnesses(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.BERRY_FIRMNESS, offset, limit);
}

/**
 * List Berry Flavors
 * @param offset The first item that you will get
 * @param limit How many Berry Flavors per page
 * @returns A list of Berry Flavors
 */
export async function listBerryFlavors(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.BERRY_FLAVOR, offset, limit);
}
