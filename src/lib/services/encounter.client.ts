import { ENDPOINTS } from "../constants";
import type {
	EncounterCondition,
	EncounterConditionValue,
	EncounterMethod,
} from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Encounter Client
 *
 * Client used to access the Encounter Endpoints:
 *  - [Encounter Methods](https://pokeapi.co/docs/v2#encounter-methods)
 *  - [Encounter Conditions](https://pokeapi.co/docs/v2#encounter-conditions)
 *  - [Encounter Condition Values](https://pokeapi.co/docs/v2#encounter-condition-values)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#encounters-section)
 */

/**
 * Get an Encounter Method by it's ID or name
 * @param id The Encounter Method ID or name
 * @returns An Encounter Method
 */
export async function getEncounterMethod(id: number | string) {
	return getResource<EncounterMethod>(ENDPOINTS.ENCOUNTER_METHOD, id);
}

/**
 * Get an Encounter Condition by it's ID or name
 * @param id The Encounter Condition ID or name
 * @returns An Encounter Condition
 */
export async function getEncounterCondition(id: number | string) {
	return getResource<EncounterCondition>(ENDPOINTS.ENCOUNTER_CONDITION, id);
}

/**
 * Get an Encounter Condition Value by it's ID or name
 * @param id The Encounter Condition Value ID or name
 * @returns An Encounter Condition Value
 */
export async function getEncounterConditionValue(id: number | string) {
	return getResource<EncounterConditionValue>(
		ENDPOINTS.ENCOUNTER_CONDITION_VALUE,
		id,
	);
}

/**
 * List Encounter Methods
 * @param offset The first item that you will get
 * @param limit How many Encounter Methods per page
 * @returns A list of Encounter Methods
 */
export async function listEncounterMethods(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ENCOUNTER_METHOD, offset, limit);
}

/**
 * List Encounter Conditions
 * @param offset The first item that you will get
 * @param limit How many Encounter Conditions per page
 * @returns A list of Encounter Methods
 */
export async function listEncounterConditions(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ENCOUNTER_CONDITION, offset, limit);
}

/**
 * List Encounter Condition Values
 * @param offset The first item that you will get
 * @param limit How many Encounter Condition Values per page
 * @returns A list of Encounter Condition Values
 */
export async function listEncounterConditionValues(
	offset?: number,
	limit?: number,
) {
	return getListResource(ENDPOINTS.ENCOUNTER_CONDITION_VALUE, offset, limit);
}
