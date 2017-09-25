package spring.util;

public class PasswordGenerator {
	private static final int SIZE = 20;
	public static String generate() {
		char[] tmp = new char[SIZE];
		for(int i=0; i<SIZE; i++) {
			int c = (char)(Math.random() * 62);
			if(c < 10) {
				tmp[i] = (char)(c + '0');
			} else if(c < 36) {
				tmp[i] = (char)(c - 10 + 'a');
			} else {
				tmp[i] = (char)(c - 36 + 'A');
			}
		}
		return new String(tmp);
	}
}
