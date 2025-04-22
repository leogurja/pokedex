import { PokemonList } from "@/components/templates/pokemon-list";
import { db } from "@/lib/db";

export default async function Home() {
	const initialData = {
		count: await db.pokemon_species.count(),
		results: await db.pokemon_species.findMany({
			include: {
				pokemon_species_names: {
					where: {
						local_language_id: 9 // english
					}
				},
			},
			take: 20,
		})
};

	return (
		<main className="container grid grid-cols-4 mx-auto">
			<PokemonList page={0} perPage={20} initialData={initialData} />
		</main>
	);
}
