import { Button } from "@/components/atoms/button";
import Link from "next/link";
import "@/styles/globals.css";

export default function NotFound() {
	return (
		<main className="grid h-screen place-items-center px-6 py-24 sm:py-32 lg:px-8">
			<div className="text-center">
				<p className="font-semibold text-base text-emerald-500">404</p>
				<h1 className="mt-4 text-balance font-semibold text-5xl text-white tracking-tight sm:text-7xl">
					Página não encontrada
				</h1>
				<p className="mt-6 text-pretty font-medium text-lg text-stone-500 sm:text-xl/8">
					Desculpe, não encontramos o que você procura.
				</p>
				<Button asChild size="xl" className="mt-10">
					<Link href="/">Voltar ao início</Link>
				</Button>
			</div>
		</main>
	);
}
