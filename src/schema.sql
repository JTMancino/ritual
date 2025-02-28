-- src/schema.sql

-- Enable the UUID extension if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS characters (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id uuid REFERENCES auth.users NOT NULL,
  name text NOT NULL,
  backstory text,
  current_level integer DEFAULT 1,
  current_health integer DEFAULT 4,
  max_health integer DEFAULT 4,
  current_focus integer DEFAULT 1,
  max_focus integer DEFAULT 1,
  armor text,
  race text,
  class text,
  subclass text,
  ability_points jsonb,  -- Example: {"brawn":10, "dexterity":10, ...}
  inventory jsonb,  -- Example: {"light armor":1, "torch":3, ...}
  scars jsonb,  -- Example: {"concussion":1, "lost limb":2, ...}
  created_at timestamp with time zone DEFAULT now()
);

ALTER TABLE characters ENABLE ROW LEVEL SECURITY;

-- Allow users to select their own characters
CREATE POLICY "Users can view their own characters" 
ON characters
FOR SELECT
USING (user_id = auth.uid());

-- Allow users to insert characters only if user_id matches
CREATE POLICY "Users can insert their own characters"
ON characters
FOR INSERT
WITH CHECK (user_id = auth.uid());

-- Allow users to update their own characters
CREATE POLICY "Users can update their own characters"
ON characters
FOR UPDATE
USING (user_id = auth.uid());

