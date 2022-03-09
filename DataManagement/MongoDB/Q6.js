printjson(db.teams.aggregate([{$group: {_id: {goals_for: "$goalsFor",goals_against: "$goalsAgainst"},teams: {$push: "$$ROOT.team"}}},   {$match: {$expr: {$gte: [{$size: "$teams"},2]}}}]))
