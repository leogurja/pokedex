import { ENDPOINTS } from "../constants";
import type {
	Item,
	ItemAttribute,
	ItemCategory,
	ItemFlingEffect,
	ItemPocket,
} from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Item Client
 *
 * Client used to access the Item Endpoints:
 *  - [Item](https://pokeapi.co/docs/v2#item)
 *  - [Item Attributes](https://pokeapi.co/docs/v2#item-attributes)
 *  - [Item Categories](https://pokeapi.co/docs/v2#item-categories)
 *  - [Item Filing Effects](https://pokeapi.co/docs/v2#item-fling-effects)
 *  - [Item Pockets](https://pokeapi.co/docs/v2#item-pockets)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#items-section)
 */

/**
 * Get an Item by it's ID or name
 * @param id The item ID or name
 * @returns An Item
 */
export async function getItem(id: number | string) {
	return getResource<Item>(ENDPOINTS.ITEM, id);
}

/**
 * Get an Item Attribute by it's ID or name
 * @param id The item attribute ID or name
 * @returns An Item Attribute
 */
export async function getItemAttribute(id: number | string) {
	return getResource<ItemAttribute>(ENDPOINTS.ITEM_ATTRIBUTE, id);
}

/**
 * Get an Item Category by it's ID or name
 * @param id The item category ID or name
 * @returns An Item Category
 */
export async function getItemCategory(id: number | string) {
	return getResource<ItemCategory>(ENDPOINTS.ITEM_CATEGORY, id);
}

/**
 * Get an Item Filing Effect by it's ID or name
 * @param id The item filing effect ID or name
 * @returns An Item Filing Effect
 */
export async function getItemFlingEffect(id: number | string) {
	return getResource<ItemFlingEffect>(ENDPOINTS.ITEM_FLING_EFFECT, id);
}

/**
 * Get an Item Pocket by it's ID or name
 * @param id The item pocket ID or name
 * @returns An Item Pocket
 */
export async function getItemPocket(id: number | string) {
	return getResource<ItemPocket>(ENDPOINTS.ITEM_POCKET, id);
}

/**
 * List Items
 * @param offset The first item that you will get
 * @param limit How many Items per page
 * @returns A list of Items
 */
export async function listItems(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ITEM, offset, limit);
}

/**
 * List Item Attributes
 * @param offset The first item that you will get
 * @param limit How many Item Attributes per page
 * @returns A list of Item Attributes
 */
export async function listItemAttributes(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ITEM_ATTRIBUTE, offset, limit);
}

/**
 * List Item Categories
 * @param offset The first item that you will get
 * @param limit How many Item Categories per page
 * @returns A list of Item Categories
 */
export async function listItemCategories(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ITEM_CATEGORY, offset, limit);
}

/**
 * List Item Filing Effects
 * @param offset The first item that you will get
 * @param limit How many Item Filing Effects per page
 * @returns A list of Item Filing Effects
 */
export async function listItemFilingEffects(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ITEM_FLING_EFFECT, offset, limit);
}

/**
 * List Item Pockets
 * @param offset The first item that you will get
 * @param limit How many Item Pockets per page
 * @returns A list of Item Pockets
 */
export async function listItemPockets(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.ITEM_POCKET, offset, limit);
}
