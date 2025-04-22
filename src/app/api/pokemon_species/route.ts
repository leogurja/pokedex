import { db } from "@/lib/db";
import type {
	pokemon_species,
	pokemon_species_names,
} from "@prisma/generated/prisma";
import type { NextRequest } from "next/server";

export interface ListPokemonSpeciesResponse {
	results: (pokemon_species & {
		pokemon_species_names: pokemon_species_names[];
	})[];
	count: number;
}

export async function GET(
	request: NextRequest,
): Promise<ListPokemonSpeciesResponse> {
	const searchParams = request.nextUrl.searchParams;
	const page = Number(searchParams.get("page") || 0);
	const perPage = Number(searchParams.get("perPage") || 20);

	const count = await db.pokemon_species.count();
	const results = await db.pokemon_species.findMany({
		include: {
			pokemon_species_names: {
				where: {
					local_language_id: 9 // english
				}
			},
		},
		take: perPage,
		skip: page * perPage,
	});

	return { results, count };
}
