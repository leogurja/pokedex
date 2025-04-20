import { ENDPOINTS } from "../constants";
import type { Machine } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Machine Client
 *
 * Client used to access the Machine Endpoints:
 *  - [Machines](https://pokeapi.co/docs/v2#machines)
 *
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#machines-section)
 */

/**
 * Get a Machine by it's ID
 * @param id The Machine ID
 * @returns A Machine
 */
export async function getMachine(id: number) {
	return getResource<Machine>(ENDPOINTS.MACHINE, id);
}

/**
 * List Machines
 * @param offset The first item that you will get
 * @param limit How many Machines per page
 * @returns A list of Machines
 */
export async function listMachines(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.MACHINE, offset, limit);
}
