// success-sound



const sound = () => {
    const audio = new Audio('star.mp3');
    const broughtTicket = document.getElementById('success-sound');
	broughtTicket.addEventListener('submit', () => {
		console.log('Playing audio');
    audio.play();
		// broughtTicket.disabled = true;
	});
}

export { sound };