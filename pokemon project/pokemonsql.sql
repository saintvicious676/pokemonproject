CREATE INDEX idx_pokemon_name ON pokemon(name);
CREATE INDEX idx_types_name ON types(name);
CREATE INDEX idx_abilities_name ON abilities(name);
CREATE INDEX idx_moves_name ON moves(name);

-- Create moves table
CREATE TABLE IF NOT EXISTS moves (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- Create stats table
CREATE TABLE IF NOT EXISTS stats (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- Create evolution table
CREATE TABLE IF NOT EXISTS evolutions (
    pokemon_id INTEGER REFERENCES pokemon(id) ON DELETE CASCADE,
    evolves_to TEXT NOT NULL
);

-- Pokemon-Moves many-to-many table
CREATE TABLE IF NOT EXISTS pokemon_moves (
    pokemon_id INTEGER REFERENCES pokemon(id) ON DELETE CASCADE,
    move_id INTEGER REFERENCES moves(id) ON DELETE CASCADE,
    PRIMARY KEY (pokemon_id, move_id)
);

-- Pokemon-Stats many-to-many table
CREATE TABLE IF NOT EXISTS pokemon_stats (
    pokemon_id INTEGER REFERENCES pokemon(id) ON DELETE CASCADE,
    stat_id INTEGER REFERENCES stats(id) ON DELETE CASCADE,
    base_stat INTEGER NOT NULL,
    PRIMARY KEY (pokemon_id, stat_id)
);

EXPLAIN ANALYZE SELECT * FROM pokemon WHERE name = 'pikachu';