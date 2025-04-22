import { Slot } from "@radix-ui/react-slot";
import type { ComponentProps } from "react";
import { type VariantProps, tv } from "tailwind-variants";

const buttonVariants = tv({
	base: [
		"inline-flex",
		"items-center",
		"justify-center",
		"gap-2",
		"whitespace-nowrap",
		"rounded-xl",
		"font-medium",
		"transition-all",
		"cursor-pointer",
		"shrink-0",
		"focus-visible:border-stone-300",
		"focus-visible:ring-stone-300/50",
		"focus-visible:ring-1",
		"aria-invalid:ring-rose-500/20",
		"aria-invalid:border-rose-500",
	],
	variants: {
		intent: {
			primary: [
				"bg-emerald-700",
				"text-white",
				"shadow-xs",
				"hover:bg-emerald-600",
			],
			secondary: [
				"bg-stone-300",
				"text-stone-950",
				"shadow-xs",
				"hover:bg-stone-100",
			],
			destructive: [
				"bg-rose-500",
				"text-white",
				"shadow-xs",
				"hover:bg-rose-400",
				"focus-visible:ring-rose-500/20",
			],
			outline: [
				"border",
				"border-emerald-500",
				"text-emerald-500",
				"bg-transparent",
				"shadow-xs",
				"hover:bg-emerald-500",
				"hover:text-white",
			],
			ghost: ["hover:bg-emerald-500", "hover:text-white"],
			link: ["text-white", "hover:text-emerald-400"],
		},
		disabled: {
			false: null,
			true: ["pointer-events-none", "opacity-50"],
		},
		size: {
			sm: "h-8 gap-1.5 px-3",
			md: "h-9 px-4 py-2",
			lg: "h-10 px-6",
			xl: "h-12 px-8",
			icon: "size-9",
			"icon-xl": "size-12",
		},
		hasIcon: {
			false: null,
			true: ["[&_svg]:shrink-0", "[&_svg]:pointer-events-none"],
		},
	},
	compoundVariants: [
		{
			size: "sm",
			hasIcon: true,
			className: "px-2.5",
		},
		{
			size: "md",
			hasIcon: true,
			className: "px-3",
		},
		{
			size: "lg",
			hasIcon: true,
			className: "px-4",
		},
		{
			size: "xl",
			hasIcon: true,
			className: "px-6",
		},
	],
	defaultVariants: {
		intent: "primary",
		size: "md",
		disabled: false,
		hasIcon: false,
	},
});

export function Button({
	className,
	intent,
	size,
	hasIcon,
	disabled,
	asChild = false,
	...props
}: ComponentProps<"button"> &
	VariantProps<typeof buttonVariants> & {
		asChild?: boolean;
	}) {
	const Comp = asChild ? Slot : "button";

	return (
		<Comp
			data-slot="button"
			className={buttonVariants({ intent, size, className, hasIcon, disabled })}
			disabled={disabled}
			{...props}
		/>
	);
}
