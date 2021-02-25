// success-sound


import { Controller } from 'stimulus';

export default class extends Controller {
	static get targets() {
		return ['trigger'];
	}

	connect() {
    	this.originalTriggerText = this.triggerTarget.value;
  	}

	play() {
		const sound = new Audio(this.triggerTarget.dataset.sound);
		sound.play();
		this.triggerTarget.value = 'Thank You For Your Purchase!';
		this.triggerTarget.setAttribute('disabled', '');
		sound.addEventListener('ended', () => {
			this.triggerTarget.removeAttribute('disabled');
			this.triggerTarget.value = this.originalTriggerText;
		});
	}
}