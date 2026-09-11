export enum AskRequestPurpose {
  SUPPORT = "SUPPORT",
  ANALYTICS = "ANALYTICS",
  PRODUCT_MODERATE = "PRODUCT_MODERATE",
}

export enum AskRequestProvider {
  OPENAI = "OPENAI",
  GEMINI = "GEMINI",
  GROQ = "GROQ",
}

export interface AskRequest {
  purpose: AskRequestPurpose;
  prompt: string;
  context?: string;
  model?: string;
  temperature?: number;
  provider?: AskRequestProvider;
}

export interface AskResponse {
  data: string;
}
