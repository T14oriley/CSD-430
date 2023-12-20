//CSD 430 Module 11 Final Project
//Tyler O'Riley
//Java package to implement tags


package myTags;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;

public class TableTag extends SimpleTagSupport {
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.write("<table border='1'>");
    	out.write("<tr>");
        out.write("<th>Class Name</th>");
        out.write("<th>Class ID</th>");
        out.write("<th>Elemental Type</th>");
        out.write("<th>Class Role</th>");
        out.write("<th>Combat Stance Opened</th>");
        out.write("<th>Gear</th>");
        out.write("<th>Weapon</th>");
        out.write("<th>Base HP</th>");
        out.write("<th>Base MP</th>");
        out.write("</tr>");
	}
}