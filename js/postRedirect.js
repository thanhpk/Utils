//redirect browser to another url with data

//example: postRedirect("http://google.com");
//postRedirect("http://google.com", {a:4, b:5});

function postRedirect(url, data) {
	var form = document.createElement("form");
  
  
  if(data != null)
  	for(var p in data) if(data.hasOwnProperty(p)){
    	var element = document.createElement("input");
      element.value = data[p];
      element.name = p;
      form.appendChild(element);
    }
  
  form.method = "POST";
  form.action = url;
  document.body.appendChild(form);
  form.submit();
}
