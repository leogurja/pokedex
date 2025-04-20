import { ENDPOINTS } from "../constants";
import type { EvolutionChain, EvolutionTrigger } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Evolution Client
 *
 * Client used to access the Berry Endpoints:
 *  - [Evolution Chains](https://pokeapi.co/docs/v2#evolution-chains)
 *  - [Evolution Triggers](https://pokeapi.co/docs/v2#evolution-triggers)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#evolution-section)
 */

/**
 * Get an Evolution Chain by it's ID
 * @param id The Evolution Chain ID
 * @returns An Evolution Chain
 */
export async function getEvolutionChain(id: number) {
	return getResource<EvolutionChain>(ENDPOINTS.EVOLUTION_CHAIN, id);
}

/**
 * Get an Evolution Trigger by it's ID or name
 * @param id The Evolution Trigger ID or name
 * @returns An Evolution Trigger
 */
export async function getEvolutionTrigger(id: number | string) {
	return getResource<EvolutionTrigger>(ENDPOINTS.EVOLUTION_TRIGGER, id);
}

/**
 * List Evolution Chains
 * @param offset The first item that you will get
 * @param limit How many Evolution Chains per page
 * @returns A list of Evolution Chains
 */
export async function listEvolutionChains(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.EVOLUTION_CHAIN, offset, limit);
}

/**
 * List Evolution Triggers
 * @param offset The first item that you will get
 * @param limit How many Evolution Triggers per page
 * @returns A list of Evolution Triggers
 */
export async function listEvolutionTriggers(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.EVOLUTION_TRIGGER, offset, limit);
}
