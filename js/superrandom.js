function randomNumber(a,b)
{
	if(b == undefined) {
		b = a;
		a = 0;
	}
	var delta = b - a + 1;
	return Math.floor(Math.random()*delta) + a;
}

var h = [];
function randomSuper(a,b)
{
	var delta = b - a + 1;
	if(h.length == 0 || h.length < delta)
	{
  	//init hash
		
		for(var i = 0 ; i < delta ; i++)
  	{
  		if(i==0) h[i] = randomNumber(0,20);
   	 else h[i] = h[i-1] + randomNumber(0,20);
  	}
  }
  var r = randomNumber(0, h[delta-1]);
  
  for(var i =0; i < delta; i++)
  	if(h[i] >= r) return i + a;
   return 'fuck'
}

alert(randomSuper(0,3));
