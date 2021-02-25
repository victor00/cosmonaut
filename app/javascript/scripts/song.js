// success-sound
const urlParams = new URLSearchParams(window.location.search);

const playSong = () => {
	if (urlParams.get('play_song')) {
		const sound = document.getElementById('starman');
		sound.play();
	}
};

setTimeout(playSong(), 1000);

