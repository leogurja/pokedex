import { db } from "@/lib/db";
import { PokemonClient } from "pokenode-ts";

const client = new PokemonClient();

const resourceList = await client.listPokemonSpecies(0, 1025);
const dbList = (await db.entries.findMany({ select: { id: true } })).map(
	(p) => p.id,
);

const filteredList = resourceList.results.filter(
	(resource) =>
		!dbList.includes(
			Number(
				resource.url
					.replace("https://pokeapi.co/api/v2/pokemon-species/", "")
					.replace("/", ""),
			),
		),
);

console.log(filteredList);
const promises = [];

for (const item of filteredList) {
	const pokemon = await client.getPokemonSpeciesByName(item.name);

	promises.push(
		db.entries.create({
			data: {
				id: pokemon.id,
				name: pokemon.names.find((i) => i.language.name === "en")?.name ?? "",
				genus:
					pokemon.genera.find((i) => i.language.name === "en")?.genus ?? "",
				isLegendary: pokemon.is_legendary,
				isMythical: pokemon.is_mythical,
				isBaby: pokemon.is_baby,
				order: pokemon.order,
			},
		}),
	);
}

await Promise.all(promises);
