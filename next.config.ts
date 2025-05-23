import type { NextConfig } from "next";

const cspHeader = `
  default-src 'self';
  script-src 'self' va.vercel-scripts.com 'unsafe-inline' ${process.env.NODE_ENV === "development" ? "'unsafe-eval'" : ""};
  img-src 'self' data: raw.githubusecontent.com;
  style-src 'self' 'unsafe-inline';
  frame-ancestors 'none';
  object-src 'none';
  upgrade-insecure-requests;
`;

export default {
	output: "standalone",
	images: {
		remotePatterns: [
			new URL(
				"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/**",
			),
		],
	},
	async headers() {
		return [
			{
				source: "/(.*)",
				headers: [
					{
						key: "Content-Security-Policy",
						value: cspHeader.replace(/\n/g, ""),
					},
				],
			},
		];
	},
} satisfies NextConfig;
