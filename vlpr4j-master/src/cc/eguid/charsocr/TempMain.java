package cc.eguid.charsocr;

public class TempMain {

	public static void main(String[] args) {
		PlateRecognition pr = new PlateRecognition();
		String ret = pr.doMain(args);
		System.out.println("结果："+ret);
	}

}
