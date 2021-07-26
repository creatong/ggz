package ggz.mallAction;

public class ActionForward {
	private boolean isRedirect;
	private String url;
	
	public ActionForward() {}

	public ActionForward(boolean isRedirect, String url) {
		super();
		this.isRedirect = isRedirect;
		this.url = url;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public String getUrl() {
		return url;
	}
	
	
}
