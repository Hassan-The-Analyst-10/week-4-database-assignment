-- ============================================
-- STEP 1: Create the partitioned posts table
-- ============================================

CREATE TABLE posts (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    metadata JSONB DEFAULT '{}',
    search_vec TSVECTOR,
    published_at TIMESTAMPTZ NOT NULL
) PARTITION BY RANGE (published_at);

-- Create the 2025 partition
CREATE TABLE posts_2025 PARTITION OF posts
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- ============================================
-- STEP 2: Create trigger for full-text search
-- ============================================

CREATE FUNCTION posts_search_update() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.search_vec := to_tsvector(
        'english',
        coalesce(NEW.title, '') || ' ' || coalesce(NEW.body, '')
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER trg_search
BEFORE INSERT OR UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION posts_search_update();

-- Create GIN index for full-text search
CREATE INDEX idx_posts_search
ON posts USING GIN (search_vec);


-- ============================================
-- STEP 3: Insert sample blog posts
-- ============================================

INSERT INTO posts (
    title,
    body,
    metadata,
    published_at
)
VALUES
(
    'PostgreSQL Indexing',
    'A guide to B-tree and GIN indexes.',
    '{"tags":["postgres","performance"]}',
    '2025-03-01'
),
(
    'Intro to JSONB',
    'Storing flexible data in Postgres.',
    '{"tags":["postgres","jsonb"]}',
    '2025-04-10'
);

-- Create GIN index for JSONB metadata
CREATE INDEX idx_posts_meta
ON posts USING GIN (metadata);

-- Query posts by tag
SELECT title
FROM posts
WHERE metadata @> '{"tags":["performance"]}';


-- ============================================
-- STEP 4: Full-text search
-- ============================================

SELECT 
    title,
    ts_rank(search_vec, q) AS rank
FROM posts,
     to_tsquery('english', 'postgres & indexing') q
WHERE search_vec @@ q
ORDER BY rank DESC;


-- ============================================
-- STEP 5: Check indexes and partition pruning
-- ============================================

EXPLAIN ANALYZE
SELECT title
FROM posts
WHERE published_at >= '2025-01-01'
  AND search_vec @@ to_tsquery('english', 'postgres');


-- ============================================
-- OPTIONAL: View all posts
-- ============================================

SELECT * FROM posts;
