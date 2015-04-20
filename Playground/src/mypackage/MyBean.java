package mypackage;

public class MyBean {
	  private String input;
	  private String output;
	  
	    public void action() {
	        output = "Welcome at the JSF world, " + input;
	    }
	    
	  
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}

}
