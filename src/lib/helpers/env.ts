import { z } from "zod";
import "server-only";

const envSchema = z.object({
	DB_FILE_NAME: z.string(),
});

export const env = envSchema.parse(process.env);
