import type { Metadata, Viewport } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import type { ReactNode } from "react";
import { Providers } from "@/components/providers";
import "../styles/globals.css";

const geistSans = Geist({
	variable: "--font-geist-sans",
	subsets: ["latin"],
	display: "swap",
	weight: "variable",
	preload: true,
});

const geistMono = Geist_Mono({
	variable: "--font-geist-mono",
	subsets: ["latin"],
	display: "swap",
	weight: "variable",
});

export const metadata = {
	title: "Pokédex",
	description:
		"Explore todos os Pokémon com estatísticas, evoluções e muito mais!",
	keywords: ["Pokémon", "Pokédex", "Leonardo", "Gurgel"],
	authors: [{ name: "Leonardo Gurgel", url: "https://gurgel.io" }],
	creator: "Leonardo Gurgel",
	openGraph: {
		title: "Pokédex",
		description: "Uma Pokédex interativa feita em Next.js por Leonardo Gurgel.",
		url: "https://pokedex.gurgel.io",
		siteName: "Pokédex",
		images: [
			{
				url: "https://pokedex.gurgel.io/og-preview.webp",
				width: 1200,
				height: 630,
			},
		],
		locale: "pt_BR",
		type: "website",
	},
	twitter: {
		card: "summary_large_image",
		title: "Pokédex",
		description: "Todos os Pokémon na palma da sua mão.",
		images: ["https://pokedex.gurgel.io/twitter-preview.webp"],
	},
	robots: {
		index: true,
		follow: true,
		nocache: false,
	},
} satisfies Metadata;

export const viewport = {
	themeColor: "#ff0000",
	colorScheme: "dark",
} satisfies Viewport;

export default function RootLayout({
	children,
}: Readonly<{
	children: ReactNode;
}>) {
	return (
		<html lang="pt-BR">
			<body
				className={`${geistSans.variable} ${geistMono.variable} font-geist-sans antialiased`}
			>
				<Providers>{children}</Providers>
			</body>
		</html>
	);
}
