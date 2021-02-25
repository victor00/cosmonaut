// success-sound


import { Controller } from 'stimulus';

export default class extends Controller {
	static get targets() {
		return ['trigger'];
	}

	play() {
		console.log("Chegou aqui MF");
		const sound = new Audio(this.triggerTarget.dataset.sound);
		sound.play();
	}
}