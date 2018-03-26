## crowdAI Leaderboard

The crowdAI leaderboard is completely dynamic and built from submission data via a series of SQL views, using the Scenic gem (from Thoughbot).

Essential the process is:

1. Submissions are made, only submissions with a 'graded' status and are considered for the leaderboard. Submissions are expected to have the **challenge_round_id** correctly populated.

2. The current state of the leaderboard is calculated via the **current_leaderboards** view.

3. The previous state of the leaderboard is calculated by the **previous_leaderboards** materialized view. This view uses a configuration parameter on the challenge (ranking_window) to determine the distance (in hours) between the current and previous leaderboards.

4. The difference in ranking between the two leaderboards is the summarized into the **leaderboards** view, and this is loaded via the leaderboards#index action into the Rails view. Two views of the leaderboard are needed to determine the difference in participant ranking.

```
                      |----- previous_leaderboards (materialized view)
leaderboards (view) --|
                      |----- current_leaderboards (view)
```

5. The **ranking_highlight** configuration parameter on the challenge drives which participants are highlighted on the leaderboard (default is the top 3).

6. The materialized views are refreshed for all challenges after every submission records is created, via a **after_create** hook on the Submission model. The refresh can also be called manually at any time from the Rails console, using:

```
Scenic.database.refresh_materialized_view(
  :previous_leaderboards,
  concurrently: false,
  cascade: false)
Scenic.database.refresh_materialized_view(
  :previous_ongoing_leaderboards,
  concurrently: false,
  cascade: false)
```

7. Submissions received after the end of the challenge are marked as **post_challenge** on the Submission model. Due to some SQL complexities, there is a parallel set of three models for **ongoing** leaderboards, which include all entries. This can potentially be refactored at some point.

8. Only the **previous_leaderboards** and **previous_ongoing_leaderboards** are currently materialized views, and we can easily modify all of the views to be materialized if performance warrants it.

The downside of using materialized views is that there is the possibility they become stale if the refresh hook doesn't work for some reason.

## Notes

### Modifying views

If views need to be changed, there is a generator available in the Scenic gem. This will copy the text for the view, in the ```db/views``` folder, as well as a migration to replace it.

```
rails generate scenic:view previous_leaderboards
```

Update the SQL text in the latest version of the view definition file, in ```db/views```.

### View dependencies

When a view is depended upon, the dependent views must be dropped first and recreated. It is not necessary to re-run the generator for the dependent views, but the migration file needs to cater for the relationships.

```
drop_view :leaderboards
update_view :previous_leaderboards, version: 2, revert_to_version: 1, materialized: true
create_view :leaderboards
```

### Materialized views

If the materialized views are affected by a migration, they should also be refreshed by the migration.

```
Scenic.database.refresh_materialized_view(
  :previous_leaderboards,
  concurrently: false,
  cascade: false)
Scenic.database.refresh_materialized_view(
  :previous_ongoing_leaderboards,
  concurrently: false,
  cascade: false)
```
