var N = 22;
//startime and endtime are time in second, for example 1465719371
//this function return time range between two date 
function getTimeRange(starttime, endtime)
{
		var me = this;
		var ret = [];

		var daydiff = Math.floor((starttime - endtime) / 86400);
		if (daydiff == 0) return [endtime - 86400, endtime];
		if (daydiff == 1) return [starttime, endtime];
		if (daydiff < N)
		{
			ret.push(starttime);
			var st = starttime;
			while (st < endtime)
			{
				st += 86400;
				ret.push(st);
			}
			ret.push(endtime);
			return ret;
		}

		var d = Math.ceil((daydiff - 2) / (N - 2));
		ret.push(starttime);
		for (var i = 1; i < N - 1; i++)
			ret.push(starttime + i * d * 86400);
		ret.push(endtime);
		return ret;
	}
	
	getTimeRange(1464719371, 1465719371);
