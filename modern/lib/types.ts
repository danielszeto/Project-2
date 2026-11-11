export type Category = 'Bread' | 'Cakes' | 'Cookies' | 'Pastries' | 'Other';
export type DietaryTag = 'Vegan' | 'Gluten-free' | 'Organic' | 'Nut-free';
export type Profile = { id: string; display_name: string; location: string; bio: string | null; avatar_url: string | null; created_at?: string };
export type Listing = { id: string; baker_id: string; title: string; description: string; price: number | null; category: Category; dietary_tags: DietaryTag[]; city: string; image_url: string | null; available: boolean; created_at: string; profiles?: Profile | null; demo?: boolean };
