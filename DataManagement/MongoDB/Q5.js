

printjson(db.players.aggregate([{$match: { position: { $in: ["forward", "midfielder"]  } }},{$group: {_id: {position_: "$position"},passesl: {$push: "$passes"}}},{$project:{totalPasses: {$sum: "$passesl"},count: {$size: "$passesl"},}},{$project:{count: 1,totalPasses: 1,average: {$divide: ["$totalPasses", "$count"]}}}]));
