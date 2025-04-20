import { ENDPOINTS } from "../constants";
import type {
	Move,
	MoveAilment,
	MoveBattleStyle,
	MoveCategory,
	MoveDamageClass,
	MoveLearnMethod,
	MoveTarget,
} from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Move Client
 *
 * Client used to access the Move Endpoints:
 *  - [Moves](https://pokeapi.co/docs/v2#moves)
 *  - [Move Ailments](https://pokeapi.co/docs/v2#move-ailments)
 *  - [Move Battle Styles](https://pokeapi.co/docs/v2#move-battle-styles)
 *  - [Move Categories](https://pokeapi.co/docs/v2#move-categories)
 *  - [Move Damage Classes](https://pokeapi.co/docs/v2#move-damage-classes)
 *  - [Move Learn Methods](https://pokeapi.co/docs/v2#move-learn-methods)
 *  - [Move Move Targets](https://pokeapi.co/docs/v2#move-targets)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#moves-section)
 */

/**
 * Get a Move by it's ID or name
 * @param id The Move ID or name
 * @returns A Move
 */
export async function getMove(id: number | string) {
	return getResource<Move>(ENDPOINTS.MOVE, id);
}

/**
 * Get a Move Ailment by it's ID or name
 * @param id The Move Ailment ID or name
 * @returns A Move Ailment
 */
export async function getMoveAilment(id: number | string) {
	return getResource<MoveAilment>(ENDPOINTS.MOVE_AILMENT, id);
}

/**
 * Get a Move Battle Style by it's ID or name
 * @param id The Move Battle Style ID or name
 * @returns A Move Battle Style
 */
export async function getMoveBattleStyle(id: number | string) {
	return getResource<MoveBattleStyle>(ENDPOINTS.MOVE_BATTLE_STYLE, id);
}

/**
 * Get a Move Battle Category by it's ID or name
 * @param id The Move Category ID or name
 * @returns A Move Category
 */
export async function getMoveCategory(id: number | string) {
	return getResource<MoveCategory>(ENDPOINTS.MOVE_CATEGORY, id);
}

/**
 * Get a Move Damage Class by it's ID or name
 * @param id The Move Damage Class ID or name or name
 * @returns A Move Damage Class or name
 */
export async function getMoveDamageClass(id: number | string) {
	return getResource<MoveDamageClass>(ENDPOINTS.MOVE_DAMAGE_CLASS, id);
}

/**
 * Get a Move Learn Method by it's ID or name
 * @param id The Move Learn Method ID or name
 * @returns A Move Learn Method
 */
export async function getMoveLearnMethod(id: number | string) {
	return getResource<MoveLearnMethod>(ENDPOINTS.MOVE_LEARN_METHOD, id);
}

/**
 * Get a Move Target by it's ID or name
 * @param id The Move Target ID or name
 * @returns A Move Target
 */
export async function getMoveTarget(id: number | string) {
	return getResource<MoveTarget>(ENDPOINTS.MOVE_TARGET, id);
}

/**
 * List Moves
 * @param offset The first item that you will get
 * @param limit How many Moves per page
 * @returns A list of Moves
 */
export async function listMoves(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE, offset, limit);
}

/**
 * List Move Ailments
 * @param offset The first item that you will get
 * @param limit How many Move Ailments per page
 * @returns A list of Move Ailments
 */
export async function listMoveAilments(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_AILMENT, offset, limit);
}

/**
 * List Move Battle Styles
 * @param offset The first item that you will get
 * @param limit How many Move Battle Styles per page
 * @returns A list of Move Battle Styles
 */
export async function listMoveBattleStyles(offset: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_BATTLE_STYLE, offset, limit);
}

/**
 * List Move Categories
 * @param offset The first item that you will get
 * @param limit How many Move Categories per page
 * @returns A list of Move Categories
 */
export async function listMoveCategories(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_CATEGORY, offset, limit);
}

/**
 * List Move Damage Classes
 * @param offset The first item that you will get
 * @param limit How many Move Damage Classes per page
 * @returns A list of Move Damage Classes
 */
export async function listMoveDamageClasses(offset: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_DAMAGE_CLASS, offset, limit);
}

/**
 * List Move Learn Methods
 * @param offset The first item that you will get
 * @param limit How many Move Learn Methods per page
 * @returns A list of Move Learn Methods
 */
export async function listMoveLearnMethods(offset: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_LEARN_METHOD, offset, limit);
}

/**
 * List Move Targets
 * @param offset The first item that you will get
 * @param limit How many Move Targets per page
 * @returns A list of Move Targets
 */
export async function listMoveTargets(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.MOVE_TARGET, offset, limit);
}
