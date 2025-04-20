import { ENDPOINTS } from "../constants";
import { getListResource, getResource } from "./base";

/**
 * ### Utility Client
 *
 * Client used to access the Utility Endpoints:
 *  - [Languages](https://pokeapi.co/docs/v2#utility-section)
 *  - Resources
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#utility-section)
 */

/**
 * Get a Language by it's ID or name
 * @param id The Language ID or name
 * @returns Language
 */
export async function getLanguage(id: number | string) {
	return getResource(ENDPOINTS.LANGUAGE, id);
}

/**
 * List Languages
 * @param offset The first item that you will get
 * @param limit How many Languages per page
 * @returns A list of Languages
 */
export async function listLanguages(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.LANGUAGE, offset, limit);
}
