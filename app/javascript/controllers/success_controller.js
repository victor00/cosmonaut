// success-sound


import { Controller } from 'stimulus';

export default class extends Controller {
	static get targets() {
		return ['trigger', 'hidden'];
	}

	connect() {
    	this.originalTriggerText = this.triggerTarget.value;
  	}

	play() {
		const sound = new Audio(this.triggerTarget.dataset.sound);
		sound.play();
		
		this.hiddenTarget.classList.add("d-none");

		this.triggerTarget.value = 'Thank You For Your Purchase!';
		this.triggerTarget.setAttribute('disabled', '');
		sound.addEventListener('ended', () => {
			window.location.replace(this.triggerTarget.dataset.redirect)
		});
	}
}