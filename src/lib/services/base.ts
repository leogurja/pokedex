import { BASE_URL, type Endpoint } from "../constants";
import type { NamedAPIResourceList } from "../models";

/**
 * Retrieves a single resource from the PokéAPI by its endpoint and identifier.
 *
 * @template T - The type of the resource to be returned.
 * @param endpoint - The endpoint of the resource.
 * @param identifier - The identifier of the resource. If not provided, an empty string will be used.
 * @returns A promise that resolves to the requested resource.
 */
export async function getResource<T>(
	endpoint: string,
	identifier?: string | number,
) {
	const response = await fetch(
		`${endpoint}/${identifier || identifier === 0 ? identifier : ""}`,
	);
	return (await response.json()) as T;
}

/**
 * Retrieves a resource by its URL.
 *
 * @template T - The type of the resource to be returned.
 * @param url - The URL of the resource.
 * @param baseURL - The base URL to use. Defaults to BASE_URL.REST.
 * @returns A promise that resolves to the requested resource.
 */
export async function getResourceByURL<T>(
	url: string,
	baseURL = BASE_URL.REST,
) {
	const ENDPOINT = url.split("v2")[1] as string;
	const response = await fetch(`${baseURL}/${ENDPOINT}`);
	return (await response.json()) as T;
}

/**
 * Retrieves a list of resources from the PokéAPI with pagination support.
 *
 * @param endpoint - The endpoint of the resource.
 * @param offset - The offset for pagination. Defaults to 0.
 * @param limit - The limit for pagination. Defaults to 20.
 * @returns A promise that resolves to a list of named API resources.
 */
export async function getListResource(
	endpoint: Endpoint,
	offset = 0,
	limit = 20,
) {
	const response = await fetch(`${endpoint}?offset=${offset}&limit=${limit}`);
	return (await response.json()) as NamedAPIResourceList;
}
