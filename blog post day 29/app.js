function println(string) {
  $('.message').append(string);
}

function helper(string, i) {
	println(string[i]);
}

i = 0;
function typing_loop() {
    helper(string, i);
    setTimeout(function() {
    	i++;
    	if (i < string.length) {
    		typing_loop();
    	} 
    }, 100);
};


i = 0;
//helper("Hello");
setInterval(function() { 
	i++; 
	if (i < string.length) { 
		helper(string, i);
	} 
	}, 1000);

string = "Today was a very exciting day! We learned how to make our javascript clickable! We made our tic-tac-toe and snake games beautiful and interactive. For the second half of the day, we began building a photo-tagging app. We will continue building the same app tomorrow. \n This program may look very simple to you, but javascript makes it annoyingly difficult to call a function over and over, while pausing a little bit between each call. In ruby, you can just call 'sleep()', which will do exactly what I described. However, in JavaScript, this becomes about 15 lines long. It was a fun challenge to write!"
typing_loop();
