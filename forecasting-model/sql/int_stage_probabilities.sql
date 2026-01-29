-- Intermediate model: stage probability mapping
-- Purpose: Define probability weights for each opportunity stage
-- Grain: one row per stage
-- Outputs: probability per stage
--NOTE: I used values table used in lieu of CASE statement. Cleaner and easier to update.

SELECT *
FROM (
    VALUES
        ('Prospecting', 0.05),
        ('Qualification', 0.10),
        ('Discovery', 0.20),
        ('Proposal', 0.40),
        ('Negotiation', 0.60),
        ('Commit', 0.80),
        ('Closed Won', 1.00),
        ('Closed Lost', 0.00)
) AS stage_probs(stage, probability);
