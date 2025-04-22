"use client";

import type { ListPokemonSpeciesResponse } from "@/app/api/pokemon_species/route";
import { getSpriteById } from "@/lib/helpers/getSpriteById";
import { useSuspenseQuery } from "@tanstack/react-query";
import Image from "next/image";

interface PokemonListProps {
	page: number;
	perPage: number;
	initialData: ListPokemonSpeciesResponse;
}

export function PokemonList({ page, perPage, initialData }: PokemonListProps) {
	const { data, error } = useSuspenseQuery<ListPokemonSpeciesResponse>({
		queryKey: ["pokemon_species", page, perPage],
		queryFn: async () => {
			const json = await fetch("/api/pokemon_species").then((r) => r.json());
			return json;
		},
		initialData,
	});

  if (error) return <p>{error.message}</p>

	return (
		<main className="container grid grid-cols-4 mx-auto">
			{data.results.map((s) => (
				<div key={s.id}>
					<Image
						src={getSpriteById(s.id.toString())}
						alt={s.identifier}
						width={360}
						height={360}
					/>
					<p className="">{s.pokemon_species_names[0]?.name}</p>
				</div>
			))}
		</main>
	);
}
