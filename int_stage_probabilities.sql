-- Intermediate model: stage probability mapping
-- Grain: one row per stage
--NOTE: I used values table used in lieu of CASE statement. Cleaner and easier to update.

select *
from (
    values
        ('Prospecting', 0.05),
        ('Qualification', 0.10),
        ('Discovery', 0.20),
        ('Proposal', 0.40),
        ('Negotiation', 0.60),
        ('Commit', 0.80),
        ('Closed Won', 1.00),
        ('Closed Lost', 0.00)
) as stage_probs(stage, probability);
