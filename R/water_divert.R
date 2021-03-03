# water_diverted
# caculates daily water diverted in acre-feet so long as flow is greater than 1000 cfs
# and water rights holders only divert for 200 days per year
#
#
# parameters: diversions (cfs), days



water_diverted = function(diversions, days) {
  #add error checking here
  if (diversions < 0)
    return("diversions must be positive value")

  day = 0
  flow_avg = 1500 #minimum flow of 1500 cfs

  while ( (flow_avg >= 1000) && (day < 200)) {
    # water right only allows for less than 200 diversion days/year
    # diverting at 50 cfs/day
    flow_avg = flow_avg - 50
    day = day + 1
  }

  #
  results = day * diversions * 1.983 #conversion from cfs to acre-feet/day
  return(results)
}
