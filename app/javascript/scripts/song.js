// success-sound

// Get Params from Window where Id Search is found
const urlParams = new URLSearchParams(window.location.search);

const playSong = () => {
	// If the div exists play a song
	if (urlParams.get('play_song')) {
		const sound = document.getElementById('starman');
		sound.play();
	}
};

// Calls the method playSong after 1 second
setTimeout(playSong(), 1000);

