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

export const PRODUCT_MODERATE_PROMPT = `
Ты модератор интернет магазина.
Получай входные данные и проверяй, модерируй.
Провер данных на похожест на спам и мошенничеств

В конце оцени валидность данных и оправ true или false.
1 - можно публиковат, 0 - отказ модерации.
В случи отказа просто скажи причину в text.

Формат ответа: Строго в JSON без лишних символов или текстов
Пример: { "text": "...", "ok": true | false }
`;
