void main() {
	for (short i = 0; i < 0xFA0; i++) {	// clear screen
		((short *) 0xB8000)[i] = 0;
	}

	*((short *) 0xB8000) = 0x024B;	// print 'K' in green at (0, 0)

	for (;;);						// don't want to exit kernel, so we have a forever loop
}
