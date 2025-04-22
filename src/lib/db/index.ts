import { PrismaClient } from "@prisma/generated/prisma";
import "server-only";

export const db = new PrismaClient();
