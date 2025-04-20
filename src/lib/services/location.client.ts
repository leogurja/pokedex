import { ENDPOINTS } from "../constants";
import type { Location, LocationArea, PalParkArea, Region } from "../models";
import { getListResource, getResource } from "./base";

/**
 * ### Location Client
 *
 * Client used to access the Location Endpoints:
 *  - [Locations](https://pokeapi.co/docs/v2#locations)
 *  - [Location Areas](https://pokeapi.co/docs/v2#location-areas)
 *  - [Pal Park Areas](https://pokeapi.co/docs/v2#pal-park-areas)
 *  - [Regions](https://pokeapi.co/docs/v2#regions)
 * ---
 * See [PokéAPI Documentation](https://pokeapi.co/docs/v2#locations-section)
 */

/**
 * Get a Location by it's ID or name
 * @param id The Location ID or name
 * @returns A location
 */
export async function getLocation(id: number | string) {
	return getResource<Location>(ENDPOINTS.LOCATION, id);
}

/**
 * Get a Location Area by it's ID or name
 * @param id The Location Area ID or name
 * @returns A Location Area
 */
export async function getLocationAreaById(id: number | string) {
	return getResource<LocationArea>(ENDPOINTS.LOCATION_AREA, id);
}

/**
 * Get a Pal Park Area by it's ID or name
 * @param id The Pal Park Area ID or name
 * @returns A Pal Park Area
 */
export async function getPalParkAreaById(id: number | string) {
	return getResource<PalParkArea>(ENDPOINTS.PALPARK_AREA, id);
}

/**
 * Get a Region by it's ID or name
 * @param id The Region ID or name
 * @returns A Region
 */
export async function getRegionById(id: number | string) {
	return getResource<Region>(ENDPOINTS.REGION, id);
}

/**
 * List Locations
 * @param offset The first item that you will get
 * @param limit How many Locations per page
 * @returns A list of Locations
 */
export async function listLocations(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.LOCATION, offset, limit);
}

/**
 * List Location Areas
 * @param offset The first item that you will get
 * @param limit How many Locations per page
 * @returns A list of Location Areas
 */
export async function listLocationAreas(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.LOCATION_AREA, offset, limit);
}

/**
 * List Pal Park Areas
 * @param offset The first item that you will get
 * @param limit How many Pal Park Areas per page
 * @returns A list of Pal Park Areas
 */
export async function listPalParkAreas(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.PALPARK_AREA, offset, limit);
}

/**
 * List Regions
 * @param offset The first item that you will get
 * @param limit How many Regions per page
 * @returns A list of Regions
 */
export async function listRegions(offset?: number, limit?: number) {
	return getListResource(ENDPOINTS.REGION, offset, limit);
}
