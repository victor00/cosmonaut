// success-sound




const sound = () => {
    const broughtTicket = document.querySelector('#success-sound');
	broughtTicket.addEventListener('click', () => {
		const audio = new Audio('/app/assets/starman.mp3');
		audio.play();
		// broughtTicket.disabled = true;
	});
}

export { sound };