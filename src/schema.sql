-- src/schema.sql

-- Enable the UUID extension if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS characters (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id uuid REFERENCES auth.users NOT NULL,
  name text NOT NULL,
  backstory text,
  current_health integer DEFAULT 0,
  max_health integer DEFAULT 0,
  current_focus integer DEFAULT 0,
  max_focus integer DEFAULT 0,
  race text,
  class text,
  subclass text,
  ability_points jsonb,  -- Example: {"strength":10, "dexterity":10, ...}
  created_at timestamp with time zone DEFAULT now()
);
