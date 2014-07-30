window.onload = ->
	w = window.navigator.platform
	fi (s): -> window.navigator.userAgent.indexOf(s) > -1

	# Check
	if fi('x86_64') || fi('x86-64') || fi('Win64') || fi('x64;') || fi('amd64') || fi('AMD64') || fi('WOW64') || fi('x64_64') || w == 'MacIntel' || w == 'Linux x86_64'
		b = 64
	else if w == 'Linux armv7l' || w == 'iPad' || w == 'iPhone' || w == 'Android' || w == 'iPod' || w == 'BlackBerry'   # Phones and tablets
		b = 0
	else if w == 'Linux i686'
		b = -1

	if b == -1
		r = "We're having trouble with Linux.  <a href='http://www.linuxforums.org/forum/newbie/104386-what-version-32-64bit-linux-installed-my-machine.html'>Try here for advice.</a>"
	else if b == 0
		r = "You're on a phone or a tablet."
	else if b == 64
		r = "Your processor is <div id='bit'>64</div> bit."
	else
		r = "Your processor is <div id='bit'>32</div> bit.<br>...Probably.  It can be hard to tell."

	document.getElementById('page').innerHTML = "<div class='main'>#{r}</div>"